require 'test_helper'

class CabinsControllerTest < ActionController::TestCase
  setup do
    @cabin = cabins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cabins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cabin" do
    assert_difference('Cabin.count') do
      post :create, cabin: { crystals: @cabin.crystals, door_locks: @cabin.door_locks, doors: @cabin.doors, elevators: @cabin.elevators, mirrors: @cabin.mirrors, observations: @cabin.observations }
    end

    assert_redirected_to cabin_path(assigns(:cabin))
  end

  test "should show cabin" do
    get :show, id: @cabin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cabin
    assert_response :success
  end

  test "should update cabin" do
    put :update, id: @cabin, cabin: { crystals: @cabin.crystals, door_locks: @cabin.door_locks, doors: @cabin.doors, elevators: @cabin.elevators, mirrors: @cabin.mirrors, observations: @cabin.observations }
    assert_redirected_to cabin_path(assigns(:cabin))
  end

  test "should destroy cabin" do
    assert_difference('Cabin.count', -1) do
      delete :destroy, id: @cabin
    end

    assert_redirected_to cabins_path
  end
end
