class BookingsController < ApplicationController
  before_action :set_raclette, only: %i[new create update destroy]
  before_action :set_booking, only: %i[edit update show]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.raclette = @raclette
    @booking.save
    redirect_to raclette_path(@raclette)
  end

  def index
  end


  def edit
  end

  def update
    @booking.update(params_booking)
    redirect_to raclette_booking_path(@booking)
  end

  def show
  end
private

  def set_booking
    @booking = Booking.find(params([:id]))
  end

  def set_raclette
    @raclette = Raclette.find(params[:raclette_id])
  end

  def params_booking
    parmas.require[:bookings].permit(:date, :description)
  end

end
