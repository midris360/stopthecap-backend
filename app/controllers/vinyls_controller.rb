class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /vinyls
  def index
    @vinyls = Vinyl.where user: @user.id

    render json: @vinyls
  end

  # GET /vinyls/1
  def show
    render json: @vinyl
  end

  # POST /vinyls
  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = @user

    if @vinyl.save
      render json: @vinyl, status: :created, location: @vinyl
    else
      render json: @vinyl.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vinyls/1
  def update
    if @vinyl.update(vinyl_params)
      render json: @vinyl
    else
      render json: @vinyl.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vinyls/1
  def destroy
    @vinyl.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vinyl_params
      params.require(:vinyl).permit(:name, :title, :user_id)
    end
end
