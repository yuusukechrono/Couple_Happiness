class AnswersController < ApplicationController
  before_action :set_answer, only: [ :show, :update]

  def index
    @answers = Answer.all.order(question_id: :asc)
    @category = params[:category]
  end

  def new
    @answer = Answer.new
  end

  def show
  end
  
  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    if params[:back]
      render :new
    else
      if @answer.save
        
      else
      render :new
      end
    end
  end

  def update
    if @answer.update(answer_params)
      
    else
      render :edit
    end
  end

  def answer_to_question
    @category_for_answer = params[:category_for_answer]
  end

  def destroy
  end

private

def answer_params
  params.require(:answer).permit( :answer, :answer_detail, :user_id, :question_id)
end

def set_answer
  @answer = Answer.find(params[:id])     
end

end
