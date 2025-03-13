class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @received_bookings = Booking.joins(:memorie).where(memories: { user: current_user })
    @my_bookings = Booking.where(user: current_user)
    @memories = Memorie.where(user: current_user)
  end
end
