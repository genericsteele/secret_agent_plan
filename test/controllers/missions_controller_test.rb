require 'test_helper'

class MissionsControllerTest < ActionController::TestCase
  test 'get index is successful' do
    get :index
    assert_includes assigns(:missions), missions(:honeypot)
    assert_response :success
  end

  test "get show is successful" do
    get :show, id: missions(:honeypot).id
    assert_equal missions(:honeypot), assigns(:mission)
    assert_response :success
  end

  test 'get new is successful' do
    get :new
    assert_kind_of Mission, assigns(:mission)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    valid_params = { code_name: "Coyote Lovely", description: "Find a notorious coyote near the Mexican border." }
    assert_difference 'Mission.count' do
      post :create, mission: valid_params
    end
    assert_redirected_to missions_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { code_name: "", description: "" }
    assert_no_difference 'Mission.count' do
      post :create, mission: invalid_params
    end
    assert_template :new
    assert_response :success
  end

  test 'get edit is successful' do
    get :edit, id: missions(:honeypot).id
    assert_equal missions(:honeypot), assigns(:mission)
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    valid_attributes = { code_name: "Cuban Seduction" }
    put :update, id: missions(:honeypot).id, mission: valid_attributes
    assert_equal valid_attributes[:code_name], missions(:honeypot).reload.code_name
    assert_redirected_to mission_path(missions(:honeypot))
  end

  test 'put update is unsuccessful with invalid attributes' do
    invalid_attributes = { code_name: "" }
    put :update, id: missions(:honeypot).id, mission: invalid_attributes
    refute_equal invalid_attributes[:code_name], missions(:honeypot).reload.code_name
    assert_template :edit
    assert_response :success
  end

  test 'delete destroy is successful' do
    assert_difference 'Mission.count', -1 do
      delete :destroy, id: missions(:honeypot).id
    end
    assert_redirected_to missions_url
  end
end

