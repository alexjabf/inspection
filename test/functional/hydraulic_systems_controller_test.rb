require 'test_helper'

class HydraulicSystemsControllerTest < ActionController::TestCase
  setup do
    @hydraulic_system = hydraulic_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hydraulic_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hydraulic_system" do
    assert_difference('HydraulicSystem.count') do
      post :create, hydraulic_system: { car_jack: @hydraulic_system.car_jack, hoses: @hydraulic_system.hoses, joystick: @hydraulic_system.joystick, observations: @hydraulic_system.observations, pto: @hydraulic_system.pto, pump: @hydraulic_system.pump, valve_box: @hydraulic_system.valve_box }
    end

    assert_redirected_to hydraulic_system_path(assigns(:hydraulic_system))
  end

  test "should show hydraulic_system" do
    get :show, id: @hydraulic_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hydraulic_system
    assert_response :success
  end

  test "should update hydraulic_system" do
    put :update, id: @hydraulic_system, hydraulic_system: { car_jack: @hydraulic_system.car_jack, hoses: @hydraulic_system.hoses, joystick: @hydraulic_system.joystick, observations: @hydraulic_system.observations, pto: @hydraulic_system.pto, pump: @hydraulic_system.pump, valve_box: @hydraulic_system.valve_box }
    assert_redirected_to hydraulic_system_path(assigns(:hydraulic_system))
  end

  test "should destroy hydraulic_system" do
    assert_difference('HydraulicSystem.count', -1) do
      delete :destroy, id: @hydraulic_system
    end

    assert_redirected_to hydraulic_systems_path
  end
end
