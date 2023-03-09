class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]
  # before_action :ensure_frame_response, only: %i[ new edit ]
  before_action :require_login

  def index
    @incompleted_notes = Note.where(completed: false).where(created_at: 10.days.ago..).order(created_at: :desc).includes(:assigned_to_user, :customer)
    @completed_notes = Note.where(completed: true).where(updated_at: 10.days.ago..).order(updated_at: :desc).includes(:assigned_to_user, :customer)
  end

  def show
  end

  def new
    @note = Note.new
    @note.created_by_user = current_user
    @note.build_customer
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.created_by_user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_url, notice: "Note saved" }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_url, notice: "Note saved" }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :completed, :assigned_to_user_id, customer_attributes: [:id, :phone_number, :name])
    end
end
