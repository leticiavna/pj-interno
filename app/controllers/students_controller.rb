class StudentsController < ApplicationController
  #skip_before_action :authorize_request, only: :create
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  # def create
  #   student = Student.create!(student_params)
  #   auth_token = AuthenticateUser.new(student.email, student.password).call
  #   response = { message: Message.account_created, auth_token: auth_token }
  #   json_response(response, :created)
  # end
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :surname, :email, :birthday,
        :description, :gender, :orientation, :password, :password_confirmation,
         :university_id, :ej_id)
    end
end
