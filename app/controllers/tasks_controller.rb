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

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end


# {"authenticity_token"=>"[FILTERED]", "task"=>{"title"=>"Do dishes",
# "details"=>"Use old soap"}, "commit"=>"Create Task"}
