require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  test 'has valid test data' do
    Agent.find_each do |agent|
      assert_valid agent
    end
  end

  test 'must have an email first_name and last_name' do
    invalid_agent = Agent.new
    assert_invalid invalid_agent
    assert_includes invalid_agent.errors[:email], "can't be blank"
    assert_includes invalid_agent.errors[:first_name], "can't be blank"
    assert_includes invalid_agent.errors[:last_name], "can't be blank"
  end

  test 'must have a unique email' do
    copycat_agent = Agent.new(email: agents(:archer).email)
    assert_invalid copycat_agent, email: "has already been taken"
  end

  test 'on_assignment collects agents on active missions' do
    agents_on_assignment = Agent.on_assignment
    assert_includes agents_on_assignment, agents(:archer)
    refute_includes agents_on_assignment, agents(:lana)
  end

  test 'not_on_assignment collects agents not on active missions' do
    agents_not_on_assignment = Agent.not_on_assignment
    assert_includes agents_not_on_assignment, agents(:lana)
    refute_includes agents_not_on_assignment, agents(:archer)
  end

  test 'name combines the first and last name' do
    assert_equal 'Sterling Archer', agents(:archer).name
  end

  test 'on_assignment? should be true if an agent is on an active mission' do
    assert agents(:archer).on_assignment?, ":archer should be on an active mission"
  end

  test 'on_assignment? should be false if an agent is not on an active mission' do
    refute agents(:lana).on_assignment?, ":lana should not be on an active mission"
  end
end

