class MemoriesController < ApplicationController
  def index
    if params[:query].present?
      # Recherche textuelle simple sur titre, description, location, et année
      @memories = Memorie.all.select do |memorie|
        memorie.title.downcase.include?(params[:query].downcase) ||
        memorie.description.downcase.include?(params[:query].downcase) ||
        memorie.location.downcase.include?(params[:query].downcase) ||
        memorie.date&.year.to_s == params[:query]
      end
      # Recherche géographique si l'adresse est incluse
      @memories = Geocoder.search(params[:query]).first&.nearby(1000, units: :km) & @memories if Geocoder.search(params[:query]).present?
    else
      @memories = Memorie.all
    end

    # Préparer les marqueurs pour la carte
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
