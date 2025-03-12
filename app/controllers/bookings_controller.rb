class BookingsController < ApplicationController
  def new
    @memorie = Memorie.find(params[:memory_id])
    @booking = Booking.new
  end

  def create
    @memorie = Memorie.find(params[:memory_id])
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :memorie_id, :user_id)
  end
end
