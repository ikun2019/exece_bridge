class QuestionsController < ApplicationController
  before_action :authenticate_engineer!

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def new
    @question = Question.new
  end
  
  def create
    question = Question.new(question_params)
    if question.save
      redirect_to questions_path
    else
      render action: :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:engineer)
  end
  
  
  private
  def question_params
    params.require(:question).permit(:title, :content).merge(engineer_id: current_engineer.id)
  end
  
end
