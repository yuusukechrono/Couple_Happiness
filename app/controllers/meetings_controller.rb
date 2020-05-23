class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @pmeetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end


  def show
  end
  
  def edit
  end

  def create
    @meeting = current_user.meetings.build(meeting_params)
    if params[:back]
      render :new
    else
      if @meeting.save
        redirect_to meetings_path, notice: "計画を作成しました！"
      else
      render :new
      end
    end
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to meetings_path, notice: "編集しました！"
    else
    render :edit
    end
  end

  
  def destroy
    @meeting.destroy
    redirect_to meetings_path, notice:"メモを削除しました！"
  end
  
  private
  
  def meeting_params
    params.require(:meeting).permit(:user_id, :category_id, :subject, :memo)
  end
  
  def set_meeting
    @meeting = Meeting.find(params[:id])     
  end

end
