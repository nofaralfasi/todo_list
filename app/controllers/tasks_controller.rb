class TasksController < ApplicationController
  def index
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @task.list_id = cookies[:list_id]
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = cookies[:list_id]
    @task.label_id = 0
    if @task.save
      # redirect_to(lists_path)
      redirect_to(list_path(cookies[:list_id]))
    else
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to(task_path(@task))
    else
      render('edit')
    end
  end

  def delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(list_path(cookies[:list_id]))
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority, :status, :label_id)
  end
end
