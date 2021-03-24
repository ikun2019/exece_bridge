class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    Answer.create(answer_params)
    redirect_to question_path(@question.id)
  end

  private
  def answer_params
    params.require(:answer).permit(:answer).merge(question_id: @question.id, engineer_id: current_engineer.id)
  end
end
