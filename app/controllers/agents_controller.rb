class AgentsController < ApplicationController
  before_action :find_agent, only: [:show, :edit, :update, :destroy]
  before_action :permit_agent_params, only: [:create, :update]

  def index
    @agents = case params[:filter].try(:fetch, :on_assignment)
    when nil
      Agent.all
    when true
      Agent.on_assignment
    when false
      Agent.not_on_assignment
    end
  end

  def show
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(params[:agent])
    if @agent.save
      redirect_to agents_path, notice: "Added #{@agent.name}"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @agent.update_attributes(params[:agent])
      redirect_to agent_path(@agent), notice: "Updated #{@agent.name} successfully"
    else
      render 'edit'
    end
  end

  def destroy
    name = @agent.name
    @agent.destroy
    redirect_to agents_path, notice: "#{name} was removed."
  end

  private

  def permit_agent_params
    params.require(:agent).permit!
  end

  def find_agent
    @agent = Agent.find(params[:id])
  end
end
