module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def current_professional
    @current_professional ||= Professional.find_by(id: session[:professional_id])
  end

  def logged_in_professional?
    current_professional.present?
  end

end