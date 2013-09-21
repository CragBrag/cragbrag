require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  setup do
    @problem = problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem" do
    assert_difference('Problem.count') do
      post :create, problem: { active: @problem.active, gym_id: @problem.gym_id, name: @problem.name, raiting: @problem.raiting }
    end

    assert_redirected_to route_path(assigns(:problem))
  end

  test "should show problem" do
    get :show, id: @problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem
    assert_response :success
  end

  test "should update problem" do
    patch :update, id: @problem, problem: { active: @problem.active, gym_id: @problem.gym_id, name: @problem.name, raiting: @problem.raiting }
    assert_redirected_to route_path(assigns(:problem))
  end

  test "should destroy problem" do
    assert_difference('Problem.count', -1) do
      delete :destroy, id: @problem
    end

    assert_redirected_to routes_path
  end
end
