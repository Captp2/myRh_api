class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      render :show, status: :created, location: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    if @offer.update(offer_params)
      render :show, status: :ok, location: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :content, :company_id, :place, :job)
    end
end
