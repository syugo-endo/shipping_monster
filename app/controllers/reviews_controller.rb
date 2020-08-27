class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @reviews = Review.all
    @reviews = Review.order("created_at DESC")
  end
  
  def new
    @review = Review.new
  end

  def create
   @review = Review.new(review_params)
    # @review.user_id = current_user.id
    # binding.pry
    # # if @review.save
    #   # binding.pry
    #   redirect_to root_path
    # else
    #  render :new
    # end
  end

  private
  def review_params
    params.require(:review).permit(:name, :content, :satisfaction_id )
  end
end
