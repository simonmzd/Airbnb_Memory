class MemoriesController < ApplicationController
  def index
    @memories = Memorie.all
    if params[:query].present?
      @memories = Memorie.search_all("#{params[:query]}")
    end
    @markers = @memories.map do |memorie|
      next unless memorie.coordinates

      {
        lat: memorie.coordinates.first,
        lng: memorie.coordinates.last,
        info_window: render_to_string(partial: "memories/info_window", locals: { memorie: memorie })
      }
    end.compact
  end

  def show
    @memorie = Memorie.find(params[:id])
    @booking = Booking.new
  end

  def new
    @memorie = Memorie.new
  end

  def create
    @memorie = Memorie.new(memorie_params)
    @memorie.user = current_user

    if params[:memorie][:date].present?
      @memorie.date = Date.parse(params[:memorie][:date])
    end

    if @memorie.save
      redirect_to memory_path(@memorie), notice: "Souvenir créé avec succès !"
    else
      puts @memorie.errors.full_messages
      flash.now[:alert] = @memorie.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def memorie_params
    params.require(:memorie).permit(:title, :description, :user_id, :date, :location, images: [])
  end
end
