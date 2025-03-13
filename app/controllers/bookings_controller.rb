class BookingsController < ApplicationController
  before_action :set_memorie, only: %i[new create accept reject destroy]
  before_action :set_booking, only: %i[accept reject destroy]

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
      redirect_to dashboard_path, notice: "Votre réservation a bien été envoyée."
    else
      render 'memories/show', alert: "Il y a eu un problème avec votre réservation."
    end
  end

  def accept
    @booking.update(status: "accepté")
    redirect_to dashboard_path, notice: "Réservation acceptée"
  end

  def reject
    @booking.update(status: "refusé")
    redirect_to dashboard_path, notice: "Réservation refusée"
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
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
