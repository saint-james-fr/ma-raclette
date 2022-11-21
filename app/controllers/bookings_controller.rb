class BookingsController < ApplicationController
  before_action :set_raclette, only: %i[new create update destroy]

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
  end

  def show
  end
private

  def set_booking
    @raclette = Raclette.find(params[:raclette_id])

  end

  def params_booking
    parmas.require[:bookings].permit(:date, :description)
  end

end
