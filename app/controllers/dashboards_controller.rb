class DashboardsController < ApplicationController
  def home
    @current_user = Current_user
    @reservations = Current_user.reservations
    @bars = Current_user.bars
    #afficher reservation user et bien d'un user
  end
end
