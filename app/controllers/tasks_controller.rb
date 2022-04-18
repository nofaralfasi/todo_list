class TasksController < ApplicationController
  before_action :get_list
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  def show
    if @task.label_id
      @label = Label.find_by(id: @task.label_id)
    end
  end

  def new
    @task = @list.tasks.build
    @labels = Label.all
  end

  def create
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to @task.list, notice: "Task `#{@task.title}` was successfully created."
    else
      @labels = Label.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @labels = Label.all
  end

  def update
    if @task.update(task_params)
      redirect_to @task.list, notice: "Task `#{@task.title}` was successfully updated."
    else
      @labels = Label.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to lists_path, notice: "Task `#{@task.title}` was successfully deleted."
  end

  private

  def get_task
    @task = Task.find_by(id: params[:id])

    if @task.blank?
      redirect_to @list, notice: "Task #{params[:id]} was not found."
    end
  end

  def get_list
    @list = List.find_by(id: params[:list_id])

    if @list.blank?
      redirect_to lists_path, notice: "List #{params[:list_id]} was not found."
    end
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :priority, :status, :label_id, :list_id)
  end
end
