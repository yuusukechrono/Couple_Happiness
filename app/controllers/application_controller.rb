class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user, :current_professional
  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless (current_user || current_professional) 
  end

end
