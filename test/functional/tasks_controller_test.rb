require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = create :task
    @attrs = attributes_for :task
    @params = { format: :json }
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

  test "should create task" do
    post :create, @params.merge(task: @attrs)
    assert_response :success
  end

  test "should show task" do
    get :show, @params.merge(id: @task)
    assert_response :success
  end

  test "should update task" do
    put :update, @params.merge(id: @task, task: @attrs)
    assert_response :success
  end

  test "should destroy task" do
    delete :destroy, @params.merge(id: @task)
    assert_response :success
  end
end
