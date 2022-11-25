class BookingsController < ApplicationController
  before_action :set_raclette, only: %i[new create edit update destroy show]
  before_action :set_booking, only: %i[edit update show accepted declined]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.raclette = @raclette
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
      flash.alert = "Booking added."
    else
      flash.alert = "Please verify all inputs"
      render "raclettes/show", status: :unprocessable_entity
    end
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(params_booking)
    redirect_to raclette_booking_path(@raclette, @booking)
  end

  def show
    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def accepted
    authorize @booking
    if @booking.update(status: "accepted")
      redirect_to dashboard_path
    end
  end

  def declined
    authorize @booking
    if @booking.update(status: "declined")
      redirect_to dashboard_path
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_raclette
    @raclette = Raclette.find(params[:raclette_id])
  end

  def params_booking
    params.require(:booking).permit(:date, :description, :raclette_id, :status, :big_eater, :normal_eater, :small_eater, :veggies)
  end
end
