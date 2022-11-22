class RaclettesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_raclette, only: %i[show edit update destroy]

  def index
    @raclettes = policy_scope(Raclette)
  end

  def show
    authorize @raclette
    @booking = Booking.new
  end

  def new
    @raclette = Raclette.new
    authorize @raclette
  end

  def create
    @raclette = Raclette.new(params_raclette)
    @raclette.user = current_user
    authorize @raclette
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
