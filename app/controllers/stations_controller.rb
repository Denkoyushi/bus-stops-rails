class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station created"
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def edit
    @station = Station.find_by(slug: params[:id])
    @lines = Line.all
  end

  def destroy
    @station = Station.find_by(slug: params[:id])
    @station.destroy
    flash[:notice] = "Station deleted"
    redirect_to stations_path
  end

  def update
    @station = Station.find_by(slug: params[:id])
    if @station.update(station_params)
      flash[:notice] = "Station Updated"
      redirect_to station_path(@station.slug)
    else
      render 'edit'
    end
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find_by(slug: params[:id])
  end

  private
  def station_params
    params.require(:station).permit(:name)
  end

end
