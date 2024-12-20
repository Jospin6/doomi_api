class Api::V1::FollowersController < ApplicationController
  before_action :set_follower, only: %i[ show update destroy ]

  # GET /followers
  def index
    @followers = Follower.all

    render json: @followers
  end

  # GET /followers/1
  def show
    render json: @follower
  end

  def user_followers
    @followers = Follower.find_by("vitrine_id", current_user.vitrine.id).count
    render json: @followers, status: :ok
  end
  

  # POST /followers
  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      render json: @follower, status: :created
    else
      render json: @follower.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /followers/1
  def update
    if @follower.update(follower_params)
      render json: @follower
    else
      render json: @follower.errors, status: :unprocessable_entity
    end
  end

  # DELETE /followers/1
  def destroy
    @follower.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follower_params
      params.require(:follower).permit(:vitrine_id, :user_id)
    end
end
