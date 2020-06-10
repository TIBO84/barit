class BarsController < ApplicationController
  def index
    @bars = Bar.where(city: params[:city])
    # authorize(@bars)
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    # MANQUE owner_id => A récuper via login (pundit)
    @bar = Bar.new(bar_params)
    @bar.user = current_user
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
