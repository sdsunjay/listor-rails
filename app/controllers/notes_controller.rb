class NotesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  def new
    @page_title = 'Add New Note'
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    # Save the note
    if @note.save
      flash[:notice] = "Note Created"
      redirect_to notes_path
    else
      flash[:alert] = "Note Not Created"
      render 'new'
    end
  end

  def update
    @note = Note.find(params[:id])

    # Update the note
    if @note.update(note_params)
      flash[:notice] = "Note Updated"
      redirect_to notes_path
    else
      flash[:alert] = "Note Not Updated"
      render 'edit'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])

    # Delete the note
    if @note.destroy
      flash[:notice] = "Note Removed"
      redirect_to notes_path
    else
      flash[:alert] = "Note Not Removed"
      render 'destroy'
    end
  end

  def index
    setup_jobs
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end
  
  def setup_jobs
        @notes = Note.where(user_id: current_user.id).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
        @note ||= Note.new
  end

  def note_params
    params.require(:note).permit(:title, :body, :candidate_id, :company_id, :job_id).merge(user_id: current_user.id)
  end
 
end
