class BookingsController < ApplicationController
  before_action :set_memorie, only: %i[new create accept reject destroy]
  before_action :set_booking, only: %i[destroy]

  def new
    @memorie = Memorie.find(params[:memory_id])
    @booking = Booking.new
  end

  def create
    @memorie = Memorie.find(params[:memory_id])
    @booking = @memorie.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "en attente"
    if @booking.save
      redirect_to dashboard_path
    else
      render 'memories/show', alert: "Il y a eu un problème avec votre réservation."
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepté")
    redirect_to dashboard_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: "refusé")
    redirect_to dashboard_path
  end

  def destroy
    if @booking.destroy
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: "Erreur lors de la suppression"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :memorie_id, :user_id)
  end

  def set_memorie
    @memorie = Memorie.find(params[:memory_id])
  end

  def set_booking
    @booking = @memorie.bookings.find(params[:id])
  end
end
