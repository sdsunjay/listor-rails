class CandidatesController < ApplicationController

 before_action :authenticate_user!
 before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  def index
      @candidates = Candidate.where(user_id: current_user.id).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
  end

  def show
  end

  def new
    @page_title = 'Add candidate'
    @candidate = current_user.candidates.build
  end

  def create
    @candidate = current_user.candidates.build(candidate_params)
    @candidate.user_id = current_user.id

    # Save the candidate
    if @candidate.save
      flash[:notice] = 'Candidate Created'
      redirect_to candidates_path
    else
        flash[:notice] = 'Candidate Not Created'
        render 'new'
    end
  end

  def edit
  end

  def update
    # Update the candidate
    if @candidate.update(candidate_params)
      flash[:notice] = 'Candidate Updated'
      redirect_to candidates_path
    else
      flash[:alert] = 'Candidate Not Updated'
      render action: 'edit'
    end
  end

  def destroy
    # Delete the candidate
    if  @candidate.destroy
      flash[:notice] = 'Candidate Removed'
      redirect_to candidates_path
    else
      render 'destroy'
    end
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
  
  def candidate_params
    params
    .require(:candidate)
    .permit(:name, :email, :phone, :status, :about, :image, :linkedin_url, :facebook_url, :user_id, job_attributes: [:id], submission_attributes: [:id])
    .merge(user_id: current_user.id)
  end
end
