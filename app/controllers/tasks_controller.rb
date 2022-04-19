class TasksController < ApplicationController
  def index
  end

  def new
    @task = Task.new
    @task.list_id = cookies[:list_id]
    # @list = List.find(flash[:list_id])
  end

  def create
    # @list = List.find(flash[:list_id])
    @task = Task.new(task_params)
    @task.list_id = cookies[:list_id]
    # @task.label_id = 0
    if @task.save
      # redirect_to(lists_path)
      redirect_to(list_path(cookies[:list_id]))
    else
      render('new')
    end
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority, :status)
  end
end
