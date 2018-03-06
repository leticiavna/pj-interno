class EJsController < ApplicationController
  before_action :set_ej, only: [:show, :update, :destroy]

  # GET /ejs
  def index
    @ejs = Ej.all

    render json: @ejs
  end

  # GET /ejs/1
  def show
    render json: @ej
  end

  # POST /ejs
  def create
    @ej = Ej.new(ej_params)

    if @ej.save
      render json: @ej, status: :created, location: @ej
    else
      render json: @ej.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ejs/1
  def update
    if @ej.update(ej_params)
      render json: @ej
    else
      render json: @ej.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ejs/1
  def destroy
    @ej.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ej
      @ej = Ej.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ej_params
      params.require(:ej).permit(:title, :university_id)
    end
end
