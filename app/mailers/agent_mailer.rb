class AgentMailer < ActionMailer::Base
  default from: 'handlers@secretagentplan.shhh'

  def welcome(agent)
    @agent = agent
    mail(to: agent.email, subject: 'Welcome to Secret Agent Plan')
  end
end
