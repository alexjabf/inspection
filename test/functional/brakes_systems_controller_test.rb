require 'test_helper'

class BrakesSystemsControllerTest < ActionController::TestCase
  setup do
    @brakes_system = brakes_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brakes_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brakes_system" do
    assert_difference('BrakesSystem.count') do
      post :create, brakes_system: { balata: @brakes_system.balata, bands: @brakes_system.bands, compressor: @brakes_system.compressor, double_chambers: @brakes_system.double_chambers, drums: @brakes_system.drums, dual: @brakes_system.dual, hoses: @brakes_system.hoses, mass: @brakes_system.mass, observations: @brakes_system.observations, palancon: @brakes_system.palancon, valve: @brakes_system.valve }
    end

    assert_redirected_to brakes_system_path(assigns(:brakes_system))
  end

  test "should show brakes_system" do
    get :show, id: @brakes_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brakes_system
    assert_response :success
  end

  test "should update brakes_system" do
    put :update, id: @brakes_system, brakes_system: { balata: @brakes_system.balata, bands: @brakes_system.bands, compressor: @brakes_system.compressor, double_chambers: @brakes_system.double_chambers, drums: @brakes_system.drums, dual: @brakes_system.dual, hoses: @brakes_system.hoses, mass: @brakes_system.mass, observations: @brakes_system.observations, palancon: @brakes_system.palancon, valve: @brakes_system.valve }
    assert_redirected_to brakes_system_path(assigns(:brakes_system))
  end

  test "should destroy brakes_system" do
    assert_difference('BrakesSystem.count', -1) do
      delete :destroy, id: @brakes_system
    end

    assert_redirected_to brakes_systems_path
  end
end
