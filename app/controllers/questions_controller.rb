class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def new
    @question = Question.new
  end
  
  def create
    question = Question.new(create_params)
    if question.save
      redirect_to questions_path
    else
      render action: :new
    end
    
  end
  
  private
  def create_params
    params.require(:question).permit(:title, :content).merge(engineer_id: current_engineer.id)
  end
  
  
end
