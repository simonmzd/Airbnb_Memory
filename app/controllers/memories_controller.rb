class MemoriesController < ApplicationController
  def index
    @memories = Memorie.all
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
    @memorie.user = current_user # Associe la mémoire à l'utilisateur connecté

    if @memorie.save
      redirect_to memory_path(@memorie), notice: "Souvenir créé avec succès !"
    else
      puts @memorie.errors.full_messages # Affiche les erreurs en console
      flash.now[:alert] = @memorie.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def memorie_params
    params.require(:memorie).permit(:title, :description, :user_id, images: [])
  end
end
