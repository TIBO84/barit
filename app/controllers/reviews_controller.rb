class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @bar = Bar.find(params[:bar_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.bar = Bar.find(params[:bar_id])
    if @review.save
      redirect_to dashboard_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :bar_id)
  end
end
