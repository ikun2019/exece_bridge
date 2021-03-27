class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    Answer.create(answer_params)
    redirect_to question_path(@question.id)
  end

  def count
    question = Question.find(params[:question_id])
    answer = question.answers.find(params[:answer_id])
    if answer.rate.blank?
      answer.update(rate: 1)
    else
      engineer_rate = answer.rate
      answer.update(rate: engineer_rate + 1)
    end
    question = Question.find(params[:question_id])
    answer = question.answers.find(params[:answer_id])
    render json: {rate: answer}
  end

  def countdown
    question = Question.find(params[:question_id])
    answer = question.answers.find(params[:answer_id])
    engineer_rate = answer.rate
    answer.update(rate: engineer_rate - 1)

    question = Question.find(params[:question_id])
    answer = question.answers.find(params[:answer_id])
    render json: {rate: answer}
  end
  
  

  private
  def answer_params
    params.require(:answer).permit(:answer).merge(question_id: @question.id, engineer_id: current_engineer.id)
  end
end
