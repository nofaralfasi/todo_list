class LabelsController < ApplicationController

  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path, notice: "Label `#{@label.title}` was successfully created."
    else
      render('new')
    end
  end

  def destroy
    @label = Label.find_by(id: params[:id])

    if @label.blank?
      redirect_to root_path, notice: "Label #{params[:id]} was not found."
    end

    if @label.destroy
      redirect_to root_path, notice: "Label `#{@label.title}` was successfully deleted."
    else
      redirect_to root_path, notice: "Label `#{@label.title}` could not be deleted."
    end
  end

  private

  def label_params
    params.require(:label).permit(:title)
  end

end
