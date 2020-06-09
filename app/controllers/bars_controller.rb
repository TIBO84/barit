class BarsController < ApplicationController
  def index
    @bars = Bar.where(city: params[:city])
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      redirect_to bars_path, notice: 'Bar successfully created'
    else
      render :new
    end
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :capacity, :ambiance, :address, :city)
  end
end
