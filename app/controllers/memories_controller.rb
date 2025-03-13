class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @memorie.update(memorie_params)
      redirect_to dashboard_path, notice: "Mémoire mise à jour avec succès."
    else
      puts @memorie.errors.full_messages
      flash.now[:alert] = @memorie.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @memorie.destroy
    redirect_to dashboard_path
  end

  private

  def set_memory
    @memorie = Memorie.find(params[:id])
  end

  def memorie_params
    params.require(:memorie).permit(:title, :description, :user_id, :date, :location, images: [])
  end
end
