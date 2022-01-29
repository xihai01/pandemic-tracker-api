class Admin::HealthRegionsController < ApplicationController
  before_action :find_region, only: [:update, :destroy]
  before_action :require_login

  #GET health regions
  def index
    @health_regions = HealthRegion.all
    render json: @health_regions
  end

  def create
    @health_region = HealthRegion.new(health_params)

    if @health_region.save
      render json: {message:'Successfully updated'}, status: 200
    else
      render json: {error: 'Unable to create health region'}, status: 400
    end
  end

  #PUT /health_region/:id 
  def update
    if @health_region
      HealthRegion.update(params[:id],health_params)
      render json: {message:'Successfully updated'}, status: 200
    else 
      render json: {error: 'Unable to update health region'}, status: 400
    end
  end

  # delete data entry
  def destroy
    @health_region.destroy
    render json: {message:'Successfully deleted'}, status: 200
  end

  private
  def health_params
    params.require(:health_region).permit(:region_code, :region_name, :stage_id)
  end

  def find_region
    @health_region = HealthRegion.find(params[:id])
  end

  def require_login
    render json: { message: "Unauthorized user: Permission denied" } unless session[:user_id]
  end

end
