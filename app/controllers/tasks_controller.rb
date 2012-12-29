class TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def show
    @task = Task.find params[:id]
    respond_with @task
  end

  def create
    @task = Task.create resource_params
    respond_with @task
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes resource_params
    respond_with @task
  end

  def destroy
    @task = Task.destroy params[:id]
    respond_with @task
  end

private

  def resource_params
    params[:task].permit(:content)
  end
end
