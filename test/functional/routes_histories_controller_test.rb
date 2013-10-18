require 'test_helper'

class RoutesHistoriesControllerTest < ActionController::TestCase
  setup do
    @routes_history = routes_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routes_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routes_history" do
    assert_difference('RoutesHistory.count') do
      post :create, routes_history: { closed: @routes_history.closed, final_km: @routes_history.final_km, finished_at: @routes_history.finished_at, initial_km: @routes_history.initial_km, started_at: @routes_history.started_at, weekday: @routes_history.weekday }
    end

    assert_redirected_to routes_history_path(assigns(:routes_history))
  end

  test "should show routes_history" do
    get :show, id: @routes_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @routes_history
    assert_response :success
  end

  test "should update routes_history" do
    put :update, id: @routes_history, routes_history: { closed: @routes_history.closed, final_km: @routes_history.final_km, finished_at: @routes_history.finished_at, initial_km: @routes_history.initial_km, started_at: @routes_history.started_at, weekday: @routes_history.weekday }
    assert_redirected_to routes_history_path(assigns(:routes_history))
  end

  test "should destroy routes_history" do
    assert_difference('RoutesHistory.count', -1) do
      delete :destroy, id: @routes_history
    end

    assert_redirected_to routes_histories_path
  end
end
