class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])

    if @list.blank?
      redirect_to(lists_path, notice: "List #{params[:id]} was not found.")
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to(list_path(@list))
    else
      render('new')
    end
  end

  def edit
    @list = List.find_by_id(params[:id])

    if @list.blank?
      redirect_to(lists_path, notice: "List #{params[:id]} was not found.")
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.blank?
      redirect_to(lists_path, notice: "List #{params[:id]} was not found.")
    end

    if @list.update(list_params)
      redirect_to(list_path(@list))
    else
      render('edit')
    end
  end

  def delete
    @list = List.find_by(id: params[:id])

    if @list.blank?
      redirect_to(lists_path, notice: "List #{params[:id]} was not found.")
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])

    if @list.blank?
      redirect_to(lists_path, notice: "List #{params[:id]} was not found.")
    end

    @list.destroy
    redirect_to(lists_path)
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
