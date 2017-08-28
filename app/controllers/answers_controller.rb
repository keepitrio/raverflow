class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :destroy, :update, :show]

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.new(answer_params)

    if @answer.save
      redirect_to @answer.question
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update
      redirect_to @answer
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_path
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
