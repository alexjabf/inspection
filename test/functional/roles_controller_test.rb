require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @role = roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post :create, role: { branch_admin: @role.branch_admin, description: @role.description, driver: @role.driver, name: @role.name, protected: @role.protected, routes_admin: @role.routes_admin, super_admin: @role.super_admin }
    end

    assert_redirected_to role_path(assigns(:role))
  end

  test "should show role" do
    get :show, id: @role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role
    assert_response :success
  end

  test "should update role" do
    put :update, id: @role, role: { branch_admin: @role.branch_admin, description: @role.description, driver: @role.driver, name: @role.name, protected: @role.protected, routes_admin: @role.routes_admin, super_admin: @role.super_admin }
    assert_redirected_to role_path(assigns(:role))
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete :destroy, id: @role
    end

    assert_redirected_to roles_path
  end
end
