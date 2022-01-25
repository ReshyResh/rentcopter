class Api::V1::HelicoptersController < ApplicationController
  # before_action :set_helicopter, only: %i[show update destroy]
  # before_action :authenticate_user!
  # before_action :authenticate_request!

  # GET /helicopters
  def index
    @helicopters = Helicopter.all

    render json: @helicopters
  end

  # GET /helicopters/1
  def show
    # @helicopter = Helicopter.find(params[:id])
    # render json: @helicopter
    render ''
  end

  # POST /helicopters
  def create
    @user = User.find(current_user.id)
    @helicopter = @user.helicopters.new(helicopter_params)
    # authorize! :create, @helicopter

    if @helicopter.save
      render json: @helicopter, status: :created, location: api_v1_helicopter_url(@helicopter)
    else
      render json: @helicopter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /helicopters/1
  def update
    if @helicopter.update(helicopter_params)
      render json: @helicopter
    else
      render json: @helicopter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /helicopters/1
  def destroy
    @helicopter.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_helicopter
    @helicopter = Helicopter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def helicopter_params
    params.require(:helicopter).permit(:name, :model, :image, :description, :rental_cost, :capacity, :flying_range,
                                       :flying_speed)
  end
end
