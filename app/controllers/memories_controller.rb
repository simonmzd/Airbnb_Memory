class MemoriesController < ApplicationController
  def index
    @memories = Memorie.all
  end
  
end
