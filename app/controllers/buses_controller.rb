class BusesController < ApplicationController

  def create
    @line = Line.find_by(number: params[:bus][:line_id])
    @bus = @line.buses.new(bus_params)
    if @bus.save
      flash[:notice] = "Bus created"
      redirect_to line_path(@line.number)
    else
      render 'new'
    end
  end

  def edit
    @bus = Bus.find(params[:id])
    @arrival = @bus.arrivals.new
  end

  def destroy
    @bus = Bus.find(params[:id])
    @line = @bus.line
    @bus.destroy
    flash[:notice] = "Bus deleted"
    redirect_to line_path(@line.number)
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
    @line = @bus.line
  end

  private
  def bus_params
    params.require(:bus).permit(:name)
  end

end
