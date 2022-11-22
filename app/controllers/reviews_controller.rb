class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update show]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.user = current_user
    @review.booking = @booking
    if @review.save
      redirect_to raclette_path(@booking.raclette)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:description, :rating, :booking_id)
  end
end
