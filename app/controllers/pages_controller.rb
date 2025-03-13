class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @received_bookings = Booking.joins(:memorie).where(memories: { user_id: current_user.id }) # Correction ici
    @my_bookings = Booking.where(user_id: current_user.id)
  end
end
