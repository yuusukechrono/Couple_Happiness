class PromisesController < ApplicationController
  before_action :set_promise, only: [:show, :edit, :update, :destroy]

  def index
    @promises = Promise.all.order(category_id: :asc)
  end

  def new
    @promise = Promise.new
  end

  def show
  end
  
  def edit
  end

  def create
    @promise = current_user.promises.build(promise_params)
    if params[:back]
      render :new
    else
      if @promise.save
        redirect_to promises_path, notice: "家訓を作成しました！"
      else
      render :new
      end
    end
  end

  def update
    if @promise.update(promise_params)
      redirect_to promises_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @promise.destroy
    redirect_to promises_path, notice:"家訓を削除しました！"
  end

private

def promise_params
  params.require(:promise).permit(:user_id, :category_id, :detail)
end

def set_promise
  @promise = Promise.find(params[:id])     
end

end
