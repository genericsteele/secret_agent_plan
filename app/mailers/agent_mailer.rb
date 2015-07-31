class AgentMailer < ActionMailer::Base
  default from: "handlers@secretagentplan.shhh"

  def welcome(agent)
    @name = agent.name

    mail to: agent.email, subject: "Welcome to Secret Agent Plan"
  end
end
