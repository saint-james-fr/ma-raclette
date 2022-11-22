class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update show]

  def destroy
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:description, :rating)
  end

end
