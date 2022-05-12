class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_labels, only: %i[new edit]

  def new
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to @task.list, notice: "Task `#{@task.title}` was successfully created."
    else
      set_labels
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task.list, notice: "Task `#{@task.title}` was successfully updated."
    else
      set_labels
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      redirect_to lists_path, notice: "Task `#{@task.title}` was successfully deleted."
    else
      redirect_to lists_path, notice: "Task `#{@task.title}` could not be deleted."
    end
  end

  private

  def set_labels
    @labels = Label.all
  end

  def set_task
    @task = Task.find_by(id: params[:id])

    return if @task.present?

    redirect_to @list, notice: "Task #{params[:id]} was not found."
  end

  def set_list
    @list = List.find_by(id: params[:list_id])

    return if @list.present?

    redirect_to lists_path, notice: "List #{params[:list_id]} was not found."
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority, :status, :label_id, :list_id)
  end
end
