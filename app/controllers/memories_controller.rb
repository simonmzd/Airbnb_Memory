class MemoriesController < ApplicationController
  def index
    @memories = Memorie.all
  end

  def show
    @memorie = Memorie.find(params[:id])
  end

  def new
    @memorie = Memorie.new
  end

  def create
    @memorie = Memorie.new(memorie_params)
    @memorie.save
    redirect_to memorie_path(@memorie)
  end

  private

  def memorie_params
    params.require(:memorie).permit(:title, :description, :image, :user_id)
  end
end
