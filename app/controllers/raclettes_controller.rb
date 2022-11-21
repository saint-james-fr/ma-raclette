class RaclettesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show, :index]

  def home
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
