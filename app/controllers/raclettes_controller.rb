class RaclettesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_raclette, only: %i[show edit update destroy]

  def index
    @raclettes = policy_scope(Raclette)
    @markers = @raclettes.geocoded.map do |raclette|
      {
        lat: raclette.latitude,
        lng: raclette.longitude,
        info_window: render_to_string(partial: "info_window", locals: {raclette: raclette}),
        image_url: helpers.asset_url("fromage")
      }
    end
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
    authorize @raclette
  end

  def update
    authorize @raclette
    @raclette.update(params_raclette)
    redirect_to raclette_path(@raclette)
  end

  def destroy
    authorize @raclette
    @raclette.destroy
    redirect_to raclettes_path, status: :see_other
  end

  private

  def set_raclette
    @raclette = Raclette.find(params[:id])
  end

  def params_raclette
    params.require(:raclette).permit(:location, :photo, :title, :description, :number_of_guests)
  end
end
