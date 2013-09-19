require 'test_helper'

class DriveSystemsControllerTest < ActionController::TestCase
  setup do
    @drive_system = drive_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drive_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drive_system" do
    assert_difference('DriveSystem.count') do
      post :create, drive_system: { arrows: @drive_system.arrows, bands: @drive_system.bands, differential: @drive_system.differential, engine: @drive_system.engine, injection: @drive_system.injection, observations: @drive_system.observations, transmission: @drive_system.transmission, yokes: @drive_system.yokes }
    end

    assert_redirected_to drive_system_path(assigns(:drive_system))
  end

  test "should show drive_system" do
    get :show, id: @drive_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drive_system
    assert_response :success
  end

  test "should update drive_system" do
    put :update, id: @drive_system, drive_system: { arrows: @drive_system.arrows, bands: @drive_system.bands, differential: @drive_system.differential, engine: @drive_system.engine, injection: @drive_system.injection, observations: @drive_system.observations, transmission: @drive_system.transmission, yokes: @drive_system.yokes }
    assert_redirected_to drive_system_path(assigns(:drive_system))
  end

  test "should destroy drive_system" do
    assert_difference('DriveSystem.count', -1) do
      delete :destroy, id: @drive_system
    end

    assert_redirected_to drive_systems_path
  end
end
