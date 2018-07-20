class QuizzesController < ApplicationController
  before_action :set_quiz, :logged_in?, only: [:show, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
    if @quizzes != nil
      render json: @quizzes
    else
      render json: {"data": "nothing"}
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # POST /quizzes/
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      render json: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    if @quiz.update(quiz_params)
      render :show, status: :ok, location: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      begin
        render json: @quiz = Quiz.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: {}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:label)
    end
end
