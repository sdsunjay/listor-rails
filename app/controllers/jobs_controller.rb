class JobsController < ApplicationController

  before_action :set_job, only: [:show, :edit, :update, :destroy, :connect]
  before_action :authenticate_user!

  def index
#    if(params.has_key?(:status) || params.has_key?(:company)
#      @jobs = Job.search(params[:status], params[:company_id]).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
#    else
        setup_jobs
 #   end
  end

  def show
  end

  def create
    @job = current_user.jobs.build(job_params)
    @job.user_id = current_user.id

    # Save the job
    if @job.save
      flash[:notice] = 'Job Created'
      redirect_to root_path
    else
        flash[:notice] = 'Job Not Created'
        setup_jobs
        render action: 'index'
    end
  end

  def edit
  end

  def update
    # Update the job
    if @job.update(job_params)
      flash[:notice] = 'Job Updated'
      redirect_to jobs_path
    else
      flash[:alert] = 'Job Not Updated'
      render action: 'edit'
    end
  end

  def destroy
    # Delete the job
    if  @job.destroy
      flash[:notice] = 'Job Removed'
      redirect_to jobs_path
    else
      render 'destroy'
    end
  end

  def connect
    @submission = Submission.new
    if @job.status == 'open'
        @submission.user_id = current_user.id
        @submission.job_id = @job.id
        @submission.candidate_id = @candidate.id
        if @submission.save
          if @job.save
            # text the driver the passenger's name and phone number
            # TODO include link to passenger's profile
            # send_connect_msg(current_user, @job.user.phone)
            #jobStatusModifierJob.perform_later
            flash[:notice] = 'Candidate added'
          else
            flash[:alert] = "Unable to update job"
          end
        else
          flash[:alert] = "Unable to add candidate"
        end
      else
        flash[:alert] = "You cannot be" 
      end
    redirect_to jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
  
  def setup_jobs
        @jobs = Job.all.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
        @job ||= Job.new
  end
  
  def job_params
    params
    .require(:job)
    .permit(:title,:description, :salary, :notes, :user_id, :company_id)
    .merge(user_id: current_user.id)
  end
end
