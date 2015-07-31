# Preview all emails at http://localhost:3000/rails/mailers/agent_mailer
class AgentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/agent_mailer/welcome
  def welcome
    AgentMailer.welcome(Agent.first)
  end

end
