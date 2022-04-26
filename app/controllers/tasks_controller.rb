class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
    set_list
  end

  def create
    @task = Task.new(task_params)
    set_list
    @task.label_id = 0
    if @task.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to list_path(cookies[:list_id]), status: :see_other
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])

    if @task.blank?
      redirect_to list_path(cookies[:list_id]), notice: "Task #{params[:id]} was not found."
    end
  end

  def set_list
    @list = List.find_by(id: cookies[:list_id])

    if @list.blank?
      redirect_to lists_path, notice: "List #{cookies[:list_id]} was not found."
    else
      @task.list_id = @list.id
    end
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority, :status, :label_id)
  end
end
