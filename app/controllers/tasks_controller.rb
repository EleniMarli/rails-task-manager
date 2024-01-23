class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    @status =
      if @task.completed == false
        'This task is not completed yet'
      else
        'This task is completed!'
      end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.completed = (params[:task][:completed] == '1')
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
