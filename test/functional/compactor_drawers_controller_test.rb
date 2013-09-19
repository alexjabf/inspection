require 'test_helper'

class CompactorDrawersControllerTest < ActionController::TestCase
  setup do
    @compactor_drawer = compactor_drawers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compactor_drawers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compactor_drawer" do
    assert_difference('CompactorDrawer.count') do
      post :create, compactor_drawer: { curtain: @compactor_drawer.curtain, floor: @compactor_drawer.floor, iron: @compactor_drawer.iron, observations: @compactor_drawer.observations, roof: @compactor_drawer.roof, shovel: @compactor_drawer.shovel, walls: @compactor_drawer.walls }
    end

    assert_redirected_to compactor_drawer_path(assigns(:compactor_drawer))
  end

  test "should show compactor_drawer" do
    get :show, id: @compactor_drawer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compactor_drawer
    assert_response :success
  end

  test "should update compactor_drawer" do
    put :update, id: @compactor_drawer, compactor_drawer: { curtain: @compactor_drawer.curtain, floor: @compactor_drawer.floor, iron: @compactor_drawer.iron, observations: @compactor_drawer.observations, roof: @compactor_drawer.roof, shovel: @compactor_drawer.shovel, walls: @compactor_drawer.walls }
    assert_redirected_to compactor_drawer_path(assigns(:compactor_drawer))
  end

  test "should destroy compactor_drawer" do
    assert_difference('CompactorDrawer.count', -1) do
      delete :destroy, id: @compactor_drawer
    end

    assert_redirected_to compactor_drawers_path
  end
end
