class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = Note.find_by_sql("SELECT customers.id, customers.name AS customer_name, users.first_name as user_first_name, users.last_name as user_last_name, newest_undone_note_per_customer.created_at, newest_undone_note_per_customer.user_id, newest_undone_note_per_customer.customer_id FROM customers INNER JOIN ( SELECT DISTINCT ON (customer_id) * FROM notes WHERE NOT done ORDER BY customer_id ) AS newest_undone_note_per_customer ON newest_undone_note_per_customer.customer_id = customers.id FULL OUTER JOIN users on newest_undone_note_per_customer.user_id = users.id ORDER BY newest_undone_note_per_customer.created_at asc")
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    @customer = @note.build_customer
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    customer = Customer.find_or_initialize_by(phone_number: note_params[:customer_attributes][:phone_number])
    customer.update_attribute(:name, note_params[:customer_attributes][:name])

    @note.customer = customer

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_url, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_url, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:content, :user_id, :done, customer_attributes: [:id, :phone_number, :name])
    end
end
