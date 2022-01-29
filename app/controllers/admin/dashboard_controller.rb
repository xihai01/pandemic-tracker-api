class Admin::DashboardController < ApplicationController
  before_action :require_login

  def index
    @data = {
      admins: Admin.all.count,
      health_regions: HealthRegion.all.count,
      stages: Stage.all.count 
    }
    render json: @data
  end

  private
  def require_login
    render json: { message: "Unauthorized user: Permission denied" } unless session[:user_id]
  end

end
