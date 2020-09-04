class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    @reviews = Review.all
    @reviews = Review.order('created_at DESC')
  end

  def new
    @review = Review.new
  end

  def create
    # binding.pry
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      # redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :content, :score)
  end
end
