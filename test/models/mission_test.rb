require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  setup do
    @mission = missions(:thunderball)
  end

  test 'has valid test data' do
    Mission.find_each do |mission|
      assert_valid mission
    end
  end

  test 'status defaults to pending' do
    assert_equal 'pending', Mission.new.status
  end

  test 'should require a description' do
    assert_invalid Mission.new, description: "can't be blank"
  end

  test 'should require a code_name' do
    assert_invalid Mission.new, code_name: "can't be blank"
  end

  test 'should require a unique code_name' do
    duplicate_mission = Mission.new(code_name: @mission.code_name)
    assert_invalid duplicate_mission, code_name: 'has already been taken'
  end

  test 'status must be pending, active, completed, or failed' do
    %w(pending active completed failed).each do |status|
      @mission.status = status
      assert_valid @mission, "Expected mission to be valid with '#{status}' status"
    end
    @mission.status = 'impossible'
    assert_invalid @mission, status: 'impossible is not a valid mission status'
  end

  test 'Mission.active should collect active missions' do
    active_missions = Mission.active
    assert_includes active_missions, missions(:thunderball)
    refute_includes active_missions, missions(:argo)
  end

  test 'active? returns whether a mission status is active' do
    assert missions(:thunderball).active?, ':thunderball should be active'
    refute missions(:argo).active?, ':argo should not be active'
  end
end
