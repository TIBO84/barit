class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def home
    @current_user = current_user
    @reservations = @current_user.reservations
    @bars = @current_user.bars
  end

  

end
