class PlansController < ApplicationController

  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
  end
  
  def edit
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if params[:back]
      render :new
    else
      if @plan.save
        redirect_to plans_path, notice: "計画を作成しました！"
      else
      render :new
      end
    end
  end

  def update
    if @plan.update(plan_params)
      redirect_to plans_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to plans_path, notice:"計画を削除しました！"
  end

private

def plan_params
  params.require(:plan).permit(:user_id, :plan_date, :detail)
end

def set_plan
  @plan = Plan.find(params[:id])     
end

end