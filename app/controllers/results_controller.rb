class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
    if @results != nil
      render json: @results
    else
      render json: {}
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    if @result.save
      render :show, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    if @result.update(result_params)
      render :show, status: :ok, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      begin
        render json: @result = Result.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: {}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.fetch(:result, {})
    end
end
