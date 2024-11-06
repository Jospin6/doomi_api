class Api::V1::NotesVitrinesController < ApplicationController
  before_action :set_notes_vitrine, only: %i[ show update destroy ]

  # GET /notes_vitrines
  def index
    @notes_vitrines = NotesVitrine.all

    render json: @notes_vitrines
  end

  # GET /notes_vitrines/1
  def show
    render json: @notes_vitrine
  end
  
  # POST /notes_vitrines
  def create
    @notes_vitrine = NotesVitrine.new(notes_vitrine_params)

    if @notes_vitrine.save
      render json: @notes_vitrine, status: :created
    else
      render json: @notes_vitrine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes_vitrines/1
  def update
    if @notes_vitrine.update(notes_vitrine_params)
      render json: @notes_vitrine
    else
      render json: @notes_vitrine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes_vitrines/1
  def destroy
    @notes_vitrine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notes_vitrine
      @notes_vitrine = NotesVitrine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notes_vitrine_params
      params.require(:notes_vitrine).permit(:vitrine_id, :client, :note)
    end
end
