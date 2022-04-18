class LabelsController < ApplicationController
  before_action :get_label, only: [:destroy]

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
    @label.destroy
    redirect_to root_path, notice: "Label `#{@label.title}` was successfully deleted."
  end


  private

  def get_label
    @label = Label.find_by(id: params[:id])

    if @label.blank?
      redirect_to root_path, notice: "Label #{params[:id]} was not found."
    end
  end

  def label_params
    params.require(:label).permit(:title)
  end

end
