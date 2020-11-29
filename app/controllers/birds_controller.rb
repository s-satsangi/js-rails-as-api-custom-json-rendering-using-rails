class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds.map do |bird| 
    #   bird.slice(:name, :species)
    # end
    render json: birds.to_json( except: [:created_at, :updated_at, :id, :species])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: "Hey ya dumbus, there ain't no bird with id: #{params[:id]}"
    end
  end
end