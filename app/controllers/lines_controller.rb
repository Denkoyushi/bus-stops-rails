class LinesController < ApplicationController

  def index
    @lines = Line.all
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Line created"
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def edit
    @line = Line.find_by(number: params[:id])
    @bus = Bus.new
    @stations = Station.all
  end

  def destroy
    @line = Line.find_by(number: params[:id])
    @line.destroy
    flash[:notice] = "Line deleted"
    redirect_to lines_path
  end

  def update
    @line = Line.find_by(number: params[:id])
    stations = Station.all
    @line.stations.delete(stations)
    Station.where(id: params[:line][:station_ids]).each do |station|
      @line.stations << station
    end
    if @line.update(line_params)
      flash[:notice] = "Line Updated"
      redirect_to line_path
    else
      render 'edit'
    end
  end

  def new
    @line = Line.new
  end

  def show
    @line = Line.find_by(number: params[:id])
  end

  private
  def line_params
    params.require(:line).permit(:number)
  end

end
