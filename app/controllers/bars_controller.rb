class BarsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bars = Bar.where("city LIKE :query", query: "#{params[:city]}%")
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.owner = current_user
    if @bar.save
      redirect_to dashboard_path, notice: 'Bar successfully created'
    else
      render :new
    end
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :capacity, :ambiance, :address, :city.downcase)
  end
end
