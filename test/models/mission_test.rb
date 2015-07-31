require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  test 'has valid test data' do
    Mission.find_each do |mission|
      assert_valid mission
    end
  end

  test 'status defaults to pending' do
    new_mission = Mission.new
    assert_equal 'pending', new_mission.status
  end

  test 'should require a description' do
    invalid_mission = Mission.new
    assert_invalid invalid_mission, description: "can't be blank"
  end

  test 'should require a code_name' do
    invalid_mission = Mission.new
    assert_invalid invalid_mission, code_name: "can't be blank"
  end

  test 'should require a unique code_name' do
    copycat_mission = Mission.new(code_name: missions(:honeypot).code_name)
    assert_invalid copycat_mission, code_name: "has already been taken"
  end

  test 'status must be pending, active, completed, or failed' do
    %w(pending active completed failed).each do |status|
      missions(:honeypot).status = status
      assert_valid missions(:honeypot), "Expected mission to be valid with #{status} status"
    end
    missions(:honeypot).status = "impossible"
    assert_invalid missions(:honeypot), status: 'impossible is not a valid mission status'
  end

  test 'Mission.active should collect active missions' do
    active_missions = Mission.active
    assert_includes active_missions, missions(:pipeline_fever)
    refute_includes active_missions, missions(:honeypot)
  end

  test 'active? returns whether a mission status is active' do
    assert missions(:pipeline_fever).active?, ":pipeline_fever should be active"
    refute missions(:honeypot).active?, ":honeypot should not be active"
  end
end
