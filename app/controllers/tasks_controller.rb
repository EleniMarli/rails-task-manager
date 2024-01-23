class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = (params[:task][:completed] == '1')
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end


# {"authenticity_token"=>"[FILTERED]", "task"=>{"title"=>"Do dishes",
# "details"=>"Use old soap"}, "commit"=>"Create Task"}
