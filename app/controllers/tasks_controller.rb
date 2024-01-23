class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status =
      if @task.completed == false
        'This task is not completed yet'
      elsif @task.completed == true
        'This task is completed!'
      else
        'Completed? Not completed? Who knows?'
      end
  end
end
