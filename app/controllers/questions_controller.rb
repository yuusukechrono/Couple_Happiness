class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(category_id: :asc)
  end

  def new
    @question = Question.new
  end

  def show
  end
  
  def edit
  end

  def create
    @question = questions.build(question_params)
    if params[:back]
      render :new
    else
      if @question.save
        redirect_to questions_path, notice: "家訓を作成しました！"
      else
      render :new
      end
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy

  end

private

def question_params
  params.require(:question).permit(:id, :category_id, :detail, :answer_right, :answer_left)
end

def set_question
  @question = Question.find(params[:id])     
end

end
