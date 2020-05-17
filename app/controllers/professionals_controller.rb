class ProfessionalsController < ApplicationController

  skip_before_action :login_required
  before_action :set_professional, only: [ :show, :update]
  
    def new
      @professional = Professional.new
    end
  
    def create
      @professional = Professional.new(professional_params)
      if @professional.save
        session[:professional_id] = @professional.id
        redirect_to professional_path(@professional.id)
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
        if Professional.find(params[:id]) == current_professional
          @professional = Professional.find(current_professional.id)
        else
          redirect_to professional_path(current_professional.id), notic:"人のIDは編集できません"
        end
    end
    
    def update
      if @professional.update(professional_params)
        redirect_to professional_path(current_professional.id), notice: "編集しました！"
      else
        render :edit
      end
    end
  
    private
  
    def professional_params
      params.require(:professional).permit(:email, :password, :password_confirmation, :last_name, :first_name, :sex, :category, :self_introduction, :service_name, :price, :bank, :branch, :branch_number, :account, :account_number, :professional_image ,:professional_image_cache)
    end

    def set_professional
      @professional = Professional.find(params[:id])     
    end


end
