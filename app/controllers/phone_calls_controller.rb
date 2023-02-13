class PhoneCallsController < ApplicationController
  before_action :set_phone_call, only: %i[ show edit update destroy ]

  # GET /phone_calls or /phone_calls.json
  def index
    @phone_calls = PhoneCall.includes(:customer)
  end

  # GET /phone_calls/1 or /phone_calls/1.json
  def show
  end

  # GET /phone_calls/new
  def new
    @phone_call = PhoneCall.new
    @customer = @phone_call.build_customer
  end

  # GET /phone_calls/1/edit
  def edit
  end

  # POST /phone_calls or /phone_calls.json
  def create
    @phone_call = PhoneCall.new(phone_call_params)



    respond_to do |format|
      if @phone_call.save
        format.html { redirect_to phone_calls_url, notice: "Phone call was successfully created." }
        format.json { render :show, status: :created, location: @phone_call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_calls/1 or /phone_calls/1.json
  def update
    respond_to do |format|
      if @phone_call.update(phone_call_params)
        format.html { redirect_to phone_call_url(@phone_call), notice: "Phone call was successfully updated." }
        format.json { render :show, status: :ok, location: @phone_call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_calls/1 or /phone_calls/1.json
  def destroy
    @phone_call.destroy

    respond_to do |format|
      format.html { redirect_to phone_calls_url, notice: "Phone call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_call
      @phone_call = PhoneCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phone_call_params
      params.require(:phone_call).permit(:notes, customer_attributes: [:name, :phone_number])
    end

end
