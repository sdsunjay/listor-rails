class LocationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  def new
    @page_title = 'Add New Location'
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

    # Save the location
    if @location.save
      flash[:notice] = "Location Created"
      redirect_to locations_path
    else
      flash[:alert] = "Location Not Created"
      render 'new'
    end
  end

  def update
    @location = Location.find(params[:id])

    # Update the location
    if @location.update(location_params)
      flash[:notice] = "Location Updated"
      redirect_to locations_path
    else
      flash[:alert] = "Location Not Updated"
      render 'edit'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])

    # Delete the location
    if @location.destroy
      flash[:notice] = "Location Removed"
      redirect_to locations_path
    else
      flash[:alert] = "Location Not Removed"
      render 'destroy'
    end
  end

  def index
    setup_jobs
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end
  
  def setup_jobs
        @locations = Location.all.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
        @location ||= Location.new
  end

  def location_params
    params.require(:location).permit(:city, :state, :zip)
  end
 
end
