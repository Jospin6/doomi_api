class Api::V1::CallsController < ApplicationController
  before_action :set_call, only: %i[ show update destroy ]

  # GET /calls
  def index
    @calls = Call.all

    render json: @calls
  end

  # GET /calls/1
  def show
    render json: @call
  end

  def user_calls
    @calls = Call.includes(:caller, :receiver)
            .where("caller = ? OR receiver = ?", current_user.id, current_user.id)
            .select("calls.*, callers.username AS caller_name, receivers.username AS receiver_name")
            .joins("INNER JOIN users AS callers ON callers.id = calls.caller")
            .joins("INNER JOIN users AS receivers ON receivers.id = calls.receiver")
  end
  

  # POST /calls
  def create
    @call = Call.new(call_params)

    if @call.save
      render json: @call, status: :created
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calls/1
  def update
    if @call.update(call_params)
      render json: @call
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calls/1
  def destroy
    @call.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:conversation_id, :user1_id, :user2_id, :call_type, :start_time, :end_time, :status)
    end
end
