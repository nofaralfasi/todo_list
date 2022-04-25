class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def find_list
    @list = List.find_by(id: params[:id])

    if @list.blank?
      redirect_to lists_path, notice: "List #{params[:id]} was not found."
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
