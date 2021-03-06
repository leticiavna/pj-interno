class ApplicationController < ActionController::API
#   include Response
#   include ExceptionHandler

#   # called before every action on controllers
#   before_action :authorize_request
#   attr_reader :current_user

#   private

#   # Check for valid request token and return user
#   def authorize_request
#     @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
#   end
# end

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
