class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bar, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @reservation = @bar.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to dashboard_path, notice: "Reservation successful, see you soon my friend !"
    else
      flash.now[:alert] = "The bar is already booked for this date !"
      render :new
    end
  end

  private

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date)
  end

end
