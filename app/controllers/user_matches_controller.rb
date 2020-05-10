class UserMatchesController < ApplicationController

   
    def new
      @user_match = UserMatch.new
    end
  
    def show
    end
    
    def edit
    end
  
    def create
      @user_match = UserMatch.new(user_match_params)
      if params[:back]
        redirect_to search_users_path
      else
        if @user_match.save
          redirect_to users_path, notice: "承認を送りました！"
        else
          redirect_to search_users_path
        end
      end
    end
  
    def update
    end
  
    def destroy
    end
  
  private
  
  def user_match_params
    params.require(:user_match).permit(:party_id, :partner_id, :confirmation_status)
  end
  
  def set_user_match
    @user_match = UserMatch.find(params[:id])     
  end
  

  

end
