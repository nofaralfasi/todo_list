class LabelsController < ApplicationController
  before_action :get_label, only: [:edit, :update, :destroy]

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

  def update
    if @label.update(label_params)
      redirect_to labels_path, notice: "Label `#{@label.title}` was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @label.destroy
      redirect_to labels_path, notice: "Label `#{@label.title}` was successfully deleted."
    else
      redirect_to labels_path, notice: "Label `#{@label.title}` could not be deleted."
    end
  end

  private

  def get_label
    @label = Label.find_by(id: params[:id])

    if @label.blank?
      redirect_to labels_path, notice: "Label #{params[:id]} was not found."
    end
  end

  def label_params
    params.require(:label).permit(:title)
  end

end
