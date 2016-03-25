class UsersController < ApplicationController
 before_action :set_user, only: [:show, :edit, :update]
    def index
    @users = User.all.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
  end


  def edit
        @user = User.find(params[:id])
  end

  def show
              @jobs = Job.where(user_id: @user.id).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
              @submissions = Submission.where(user_id: @user.id).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
              @submission = Submission.new
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { redirect_to @user, notice: 'Errors.' }
      end
    end   
  end  
 
  def destroy
      @user = User.find(params[:id])

      @user = User.destroy(params[:id])
      if @user
          flash[:notice] = "User Removed"
          redirect_to root_path
      else
          render 'destroy'
      end
  end
  
  private
   
  def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :company_id] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
