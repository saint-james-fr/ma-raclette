class RaclettesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show index]
  before_action :set_raclette, only: %i[show edit update destroy]

  def home
  end

  def index
    Raclette.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @raclette = Raclette.new
  end

  def create
    @raclette = Raclette.new(params_raclette)
    @raclette.user = current_user
    if @raclette.save
      redirect_to raclette_path(@raclette)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @raclette.update(params_raclette)
    redirect_to raclette_path(@raclette)
  end

  def destroy
    @raclette.destroy
    redirect_to raclettes_path, status: :see_other
  end

  private

  def set_raclette
    @raclette = Raclette.find(params[:id])
  end

  def params_raclette
    params.require(:raclette).permit(:location, :photo)
  end
end
