require 'test_helper'

class SchedulesHistoriesControllerTest < ActionController::TestCase
  setup do
    @schedules_history = schedules_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedules_history" do
    assert_difference('SchedulesHistory.count') do
      post :create, schedules_history: { visited: @schedules_history.visited, visited_at: @schedules_history.visited_at }
    end

    assert_redirected_to schedules_history_path(assigns(:schedules_history))
  end

  test "should show schedules_history" do
    get :show, id: @schedules_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedules_history
    assert_response :success
  end

  test "should update schedules_history" do
    put :update, id: @schedules_history, schedules_history: { visited: @schedules_history.visited, visited_at: @schedules_history.visited_at }
    assert_redirected_to schedules_history_path(assigns(:schedules_history))
  end

  test "should destroy schedules_history" do
    assert_difference('SchedulesHistory.count', -1) do
      delete :destroy, id: @schedules_history
    end

    assert_redirected_to schedules_histories_path
  end
end
