class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def index
    if params[:filter]
      @agents = params[:filter][:on_assignment] ? Agent.on_assignment : Agent.not_on_assignment
    else
      @agents = Agent.all
    end
  end

  def show
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      redirect_to agents_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @agent.update(agent_params)
      redirect_to @agent
    else
      render :edit
    end
  end

  def destroy
    @agent.destroy
    redirect_to agents_url
  end

  private

    def agent_params
      params.require(:agent).permit(:first_name, :last_name, :email)
    end

    def set_agent
      @agent = Agent.find(params[:id])
    end
end
