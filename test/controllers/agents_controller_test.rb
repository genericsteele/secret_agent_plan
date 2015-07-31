require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  test 'get index is successful' do
    get :index
    assert_includes assigns(:agents), agents(:archer)
    assert_response :success
  end

  test 'get index includes all agents by default' do
    get :index
    assert_equal Agent.count, assigns(:agents).count
  end

  test 'get index can filter agents on a mission' do
    get :index, filter: { on_assignment: true }
    assert_equal Agent.on_assignment.count, assigns(:agents).count
    assert_response :success
  end

  test 'get index can filter agents not on a mission' do
    get :index, filter: { on_assignment: false }
    assert_equal Agent.not_on_assignment.count, assigns(:agents).count
    assert_response :success
  end

  test 'get show is successful' do
    get :show, id: agents(:archer).id
    assert_equal agents(:archer), assigns(:agent)
    assert_response :success
  end

  test 'get new is successful' do
    get :new
    assert_kind_of Agent, assigns(:agent)
    assert_response :success
  end

  test 'get edit is successful' do
    get :edit, id: agents(:archer).id
    assert_equal agents(:archer), assigns(:agent)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    valid_params = { first_name: "Cyril", last_name: "Figgis", email: "sexaddict@cia.gov" }
    assert_difference 'Agent.count' do
      post :create, agent: valid_params
    end
    assert_redirected_to agents_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { first_name: "", last_name: "", email: "" }
    assert_no_difference 'Agent.count' do
      post :create, agent: invalid_params
    end
    assert_template :new
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    valid_attributes = { email: "ihavecancer@cia.gov" }
    put :update, id: agents(:archer).id, agent: valid_attributes
    assert_equal valid_attributes[:email], agents(:archer).reload.email
    assert_redirected_to agent_path(agents(:archer))
  end

  test 'put update is unsuccessful with invalid attributes' do
    invalid_attributes = { email: "" }
    put :update, id: agents(:archer).id, agent: invalid_attributes
    refute_equal invalid_attributes[:email], agents(:archer).reload.email
    assert_template :edit
    assert_response :success
  end

  test 'delete destroy is successful' do
    assert_difference 'Agent.count', -1 do
      delete :destroy, id: agents(:archer).id
    end
    assert_redirected_to agents_path
  end
end
