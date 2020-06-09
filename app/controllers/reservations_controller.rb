class ReservationsController < ApplicationController
  before_action :set_bar, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.bar = @bar
    if @reservation.save
      redirect_to root_path # redirect to dashboard!!!!
    else
      render :new
    end
  end

  private

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :bar_id, :date)
  end
end
