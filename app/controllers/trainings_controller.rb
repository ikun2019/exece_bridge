class TrainingsController < ApplicationController
  before_action :engineer_premium?

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

  def engineer_premium?
    if engineer_signed_in? && current_engineer.premium
      true
    elsif engineer_signed_in? && !current_engineer.premium
      redirect_to engineers_path, notice: "こちらのページを閲覧するには有料会員に登録する必要があります。"
    else
      redirect_to new_customer_session_path
    end
  end
end
