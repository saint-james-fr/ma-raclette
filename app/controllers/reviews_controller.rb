class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create edit update]
  before_action :set_review, only: %i[edit update]

  def new
    @review = Review.new(booking_id: @booking.id)
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.user = current_user
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to raclette_path(@booking.raclette)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    @review.update(params_review)
    redirect_to raclette_path(@booking.raclette)
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
