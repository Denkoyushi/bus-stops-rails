class BusesController < ApplicationController

  def index
    @buses = Bus.all
  end

  def create
    @line = Line.find_by(number: params[:line_id])
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:notice] = "Bus created"
      redirect_to line_path(@line.number)
    else
      render 'new'
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def destroy
    # @bus = Bus.find(params[:id])
    # @bus.destroy
    # flash[:notice] = "Bus deleted"
    # redirect_to line_path(@line.number)
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:notice] = "Bus Updated"
      redirect_to bus_path
    else
      render 'edit'
    end
  end

  def new
    @bus = Bus.new
  end

  def show
    @bus = Bus.find(params[:id])
  end

  private
  def bus_params
    params.require(:bus).permit(:line_id)
  end

end
