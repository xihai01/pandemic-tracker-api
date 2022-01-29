class Admin::StagesController < ApplicationController
  before_action :find_stage, only: [:update, :destroy]
  before_action :require_login

   #GET stages
  def index
    @stages = Stage.all
    render json: @stages
  end

  # create a new stage
  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      render json: {message:'Successfully created'}, status: 200
    else
      render json: {error: 'Unable to create new stage'}, status: 400
    end
  end


  #PUT /admin/stages/:id 
  def update
    if @stage
      Stage.update(params[:id],stage_params)
      render json: {message:'Successfully updated'}, status: 200
    else 
      render json: {error: 'Unable to update health region'}, status: 400
    end
  end

  def destroy
    @stage.destroy
    render json: {message:'Successfully deleted'}, status: 200
  end

  private
  def stage_params
    params.require(:stage).permit(:max_indoor_gathering, :max_outdoor_gathering, 
    :retail, :ceremony, :food_establishments, :sports_recreational, :entertainment, :personal_care,
    :color_code)
  end

  def find_stage
    @stage = Stage.find(params[:id])
  end

  def require_login
    render json: { message: "Unauthorized user: Permission denied" } unless session[:user_id]
  end
end
