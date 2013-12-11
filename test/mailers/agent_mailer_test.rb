require 'test_helper'

class AgentMailerTest < ActionMailer::TestCase
  test 'welcome' do
    email = AgentMailer.welcome(agents(:bond)).deliver
    assert_equal [agents(:bond).email], email.to
    assert_equal ['handlers@secretagentplan.shhh'], email.from
    assert_equal 'Welcome to Secret Agent Plan', email.subject
    assert_match agents(:bond).name, email.body.to_s
    assert ActionMailer::Base.deliveries.any?, 'expected a welcome email to be delivered'
  end
end
