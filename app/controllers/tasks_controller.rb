class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(restaurant_params)
    @task.save
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update(restaurant_params)
    redirect_to tasks_path
  end

def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

private

  def restaurant_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
