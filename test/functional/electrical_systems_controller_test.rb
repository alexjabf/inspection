require 'test_helper'

class ElectricalSystemsControllerTest < ActionController::TestCase
  setup do
    @electrical_system = electrical_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electrical_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electrical_system" do
    assert_difference('ElectricalSystem.count') do
      post :create, electrical_system: { accumulator: @electrical_system.accumulator, lights: @electrical_system.lights, observations: @electrical_system.observations, start_up: @electrical_system.start_up }
    end

    assert_redirected_to electrical_system_path(assigns(:electrical_system))
  end

  test "should show electrical_system" do
    get :show, id: @electrical_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electrical_system
    assert_response :success
  end

  test "should update electrical_system" do
    put :update, id: @electrical_system, electrical_system: { accumulator: @electrical_system.accumulator, lights: @electrical_system.lights, observations: @electrical_system.observations, start_up: @electrical_system.start_up }
    assert_redirected_to electrical_system_path(assigns(:electrical_system))
  end

  test "should destroy electrical_system" do
    assert_difference('ElectricalSystem.count', -1) do
      delete :destroy, id: @electrical_system
    end

    assert_redirected_to electrical_systems_path
  end
end
