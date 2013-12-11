class MissionsController < ApplicationController
  before_filter :get_mission, only: [:show, :edit, :update, :destroy]
  before_filter :permit_mission_params, only: [:create, :update]

  def index
    @missions = Mission.all
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(params[:mission])
    if @mission.save
      redirect_to @mission, notice: "Added #{@mission.code_name}"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @mission.update_attributes(params[:mission])
      redirect_to @mission, notice: "Updated #{@mission.code_name} successfully"
    else
      render 'edit'
    end
  end

  def destroy
    code_name = @mission.code_name
    @mission.destroy
    redirect_to missions_path, notice: "#{code_name} was removed."
  end
  
  private

  def permit_mission_params
    params.require(:mission).permit!
  end

  def get_mission
    @mission = Mission.find(params[:id])
  end
end

