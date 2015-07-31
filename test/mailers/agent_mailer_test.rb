require 'test_helper'

class AgentMailerTest < ActionMailer::TestCase
  test 'welcome' do
    email = AgentMailer.welcome(agents(:archer)).deliver
    assert_equal [agents(:archer).email], email.to
    assert_equal ['handlers@secretagentplan.shhh'], email.from
    assert_equal "Welcome to Secret Agent Plan", email.subject
    assert_match agents(:archer).name, email.body.to_s
    assert ActionMailer::Base.deliveries.any?, 'expected welcome email to be delivered'
  end
end
