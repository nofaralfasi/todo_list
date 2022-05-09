class ListsController < ApplicationController
  before_action :get_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "List `#{@list.title}` was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "List `#{@list.title}` was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.destroy
      redirect_to lists_path, status: :see_other, notice: "List `#{@list.title}` was successfully deleted."
    else
      redirect_to lists_path, notice: "List `#{@list.title}` could not be deleted."
    end
  end

  private

  def get_list
    @list = List.find_by(id: params[:id])

    if @list.blank?
      redirect_to lists_path, notice: "List #{params[:id]} was not found."
    end
  end

  def list_params
    params.require(:list).permit(:title)
  end

end
