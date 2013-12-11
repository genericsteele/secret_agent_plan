require 'test_helper'

class MissionsControllerTest < ActionController::TestCase
  setup do
    @mission = missions(:thunderball)
  end

  test 'get index is successful' do
    get :index
    assert_response :success
  end

  test "get show is successful" do
    get :show, id: missions(:thunderball).id
    assert_response :success
  end

  test 'get new is successful' do
    get :new
    assert_not_nil assigns(:mission)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    mission_params = { code_name: 'New Mission', description: 'Just a new mission. Secret stuff.' }
    assert_difference 'Mission.count' do
      post :create, mission: mission_params
    end
    assert_redirected_to assigns(:mission)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { code_name: '' }
    assert_no_difference 'Mission.count' do
      post :create, mission: invalid_params
    end
    assert_template 'new'
  end

  test 'get edit is successful' do
    get :edit, id: @mission.id
    assert_equal @mission, assigns(:mission)
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    updated_params = { code_name: "Updated Code Name" }
    put :update, id: @mission.id, mission: updated_params
    assert_equal updated_params[:code_name], @mission.reload.code_name
    assert_match /#{@mission.code_name}/, flash[:notice]
    assert_redirected_to mission_path(@mission)
  end

  test 'put update is unsuccessful with invalid attributes' do
    invalid_params = { code_name: "" }
    put :update, id: @mission.id, mission: invalid_params
    assert_not_equal invalid_params[:code_name], @mission.reload.code_name
    assert_template 'edit'
  end

  test 'delete destroy is successful' do
    assert_difference 'Mission.count', -1 do
      delete :destroy, id: @mission.id
    end
    assert_match /#{@mission.code_name}/, flash[:notice]
    assert_redirected_to missions_path
  end
end

