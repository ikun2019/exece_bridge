class TrainingsController < ApplicationController
  before_action :authenticate_engineer!

  def index
    @kansu1 = Training.all.where(genre_id: 1, lesson_id: 1)
  end

  def new
    @training = Training.new
  end

  def create
    Training.create(training_params)
    redirect_to trainings_path
  end

  def show
    @training = Training.find(params[:id])
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    Training.update(training_params)
    redirect_to trainings_path
  end
  
  private
  def training_params
    params.require(:training).permit(:genre_id, :lesson_id, :title, :detail)
  end

end
