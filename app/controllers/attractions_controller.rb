class AttractionsController < ApplicationController
  before_action :authentication_required, except: [:index, :show]
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render :new
      end
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end