class AnswersController < ApplicationController

  def index
    @answers = Answer.all.order(question_id: :asc)
  end

  def new
    @answer = Answer.new
  end

  def show
  end
  
  def edit
  end

  def create
    @answer = answers.build(answer_params)
    if params[:back]
      render :new
    else
      if @answer.save
        redirect_to answers_path, notice: "質問に回答しました！"
      else
      render :new
      end
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to answers_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy

  end

private

def answer_params
  params.require(:answer).permit(:id, :answer, answer_detail, :user_id, :question_id)
end

def set_question
  @answer = Answer.find(params[:id])     
end

end
