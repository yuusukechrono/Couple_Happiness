class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def create_professional
    professional = Professional.find_by(email: params[:session][:email].downcase)
    if professional && professional.authenticate(params[:session][:password])
      session[:professional_id] = professional.id
      redirect_to professional_path(professional.id)
    else
      binding.irb
      flash.now[:danger] = 'ログインに失敗しました'
      redirect_to new_professional_sessions_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice]='ログアウトしました'
    redirect_to new_session_path
  end

  def destroy_professional
    session.delete(:professional_id)
    flash[:notice]='ログアウトしました'
    redirect_to new_professional_sessions_path
  end

  def new_professional
  end

end
