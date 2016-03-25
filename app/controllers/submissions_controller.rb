class SubmissionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  def new
    @page_title = 'Add New Submission'
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)
    if @job.status == 'open'
        @submission.user_id = current_user.id
        @submission.job_id = @job.id
        @submission.candidate_id = @candidate.id
        if @submission.save
          if @job.save
            flash[:notice] = 'Candidate added'
          else
            flash[:alert] = "Unable to update job"
          end
        else
          flash[:alert] = "Unable to add candidate"
        end
      else
        flash[:alert] = "Job is closed" 
      end
    redirect_to user_path
  end
  def create
    @submission = Submission.create(submission_params)
    # Save the submission
    if @submission.save
      flash[:notice] = "Submission Created"
      redirect_to submissions_path
    else
      flash[:alert] = "Submission Not Created"
      render 'new'
    end
  end

  def update
    @submission = Submission.find(params[:id])

    # Update the submission
    if @submission.update(submission_params)
      flash[:notice] = "Submission Updated"
      redirect_to submissions_path
    else
      flash[:alert] = "Submission Not Updated"
      render 'edit'
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def destroy
    @submission = Submission.find(params[:id])

    # Delete the submission
    if @submission.destroy
      flash[:notice] = "Submission Removed"
      redirect_to submissions_path
    else
      flash[:alert] = "Submission Not Removed"
      render 'destroy'
    end
  end

  def index
    setup_jobs
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end
  
  def setup_jobs
        @submissions = Submission.where(user_id: current_user.id).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
        @submission ||= Submission.new
  end

  def submission_params
    params.require(:submission).permit(:status, :candidate_id, :job_id).merge(user_id: current_user.id)
  end
 
end
