module AgentHelper
  def link_to_agent_email(agent)
    link_to agent.name, "mailto:#{agent.email}", class: 'mailto', target: '_blank'
  end
end
