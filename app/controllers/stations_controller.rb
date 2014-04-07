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
    @line = Line.find_by(number: params[:id])
    @stations = Station.all
  end

  def destroy
  end

  def update
    @station = Station.find_by(number: params[:id])
    if @station.update(line_params)
      flash[:notice] = "Line Updated"
      redirect_to 'show'
    else
      render 'edit'
    end
  end

  def new
    @station = Station.new
  end

  def show
    @station = Station.find_by(number: params[:id])
  end

  private
  def station_params
    params.require(:station).permit(:name)
  end

end
