class ReviewsController < ApplicationController
  before_action :reviews_set, only: [:create, :destroy]

  def create
    @review = Review.new(review_params)
    @review.save
    count_set
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    count_set
  end

  private
  def review_params
    params.require(:review).permit(:review).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def reviews_set
    @reviews = Item.find(params[:item_id]).reviews
  end

  def count_set
    @count = @reviews.count
  end
end
