class LocationsController < ApplicationController

  before_filter :is_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to admins_path
  end

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    redirect_to admins_path
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to admins_path
  end

  private

  def location_params
    params.require(:location).permit!
  end

end