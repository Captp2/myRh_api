class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :update, :destroy]

  # GET /offre
  # GET /offers.json
  def index
    @offers = Offer.all
    if @offers != nil
      render json: @offers
    else
      render json: {"data": "nothing"}
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # POST /offers
  # POST /offers.json
  def create
    # head :ok
    @offer = Offer.new(offer_params)

    # if @offer.save
    #   render json: @offer
    # else
    #   render json: @offer.errors, status: :unprocessable_entity
    # end
    # render json: offer_params
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

      begin
        @offer = Offer.find(params[:id])
        # my_record = Record.find params[:id]
      rescue ActiveRecord::RecordNotFound => e
        @offer = nil
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.permit(:title, :content, :company_id, :place, :job)
    end
end
