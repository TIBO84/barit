class BarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    cookies[:search] = params[:city]
    puts cookies[:search]
    @bars = Bar.where("city LIKE :query", query: "#{params[:city]}%").geocoded
    @markers = @bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('marker_beer.png')
      }
    end
  end

  def show
    @search = cookies[:search]
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
    params.require(:bar).permit(:name, :capacity, :ambiance, :address, :city.downcase, :photo, :price, :description)
  end

end
