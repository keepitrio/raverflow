class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :destroy, :update, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      @errors = @question.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end


  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content)
    end
end
