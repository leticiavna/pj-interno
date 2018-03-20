class AuthorizeApiRequest
  prepend SimpleCommand

   def initialize(headers = {})
     @headers = headers
   end

   # Service entry point - return valid user object
   def call
    #{user: user}
     user
   end

   private

   attr_reader :headers

# check if user is in the database
# memoize user object
   def user
     @user ||= Student.find(decoded_auth_token[:user_id]) if decoded_auth_token
     @user || errors.add(:token, 'Invalid token') && nil
   end

# decode authentication token
   def decoded_auth_token
     @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
   end


# check for token in `Authorization` header
   def http_auth_header
     if headers['Authorization'].present?
       return headers['Authorization'].split(' ').last
     else
      #raise(ExceptionHandler::MissingToken, Message.missing_token)
       errors.add(:token, 'Missing token')
     end
     nil
   end
 end

# def user
# @user ||= Student.find(decoded_auth_token[:user_id]) if decoded_auth_token
# # handle user not found
# rescue ActiveRecord::RecordNotFound => e
# # raise custom error
# raise(
#   ExceptionHandler::InvalidToken,
#   ("#{Message.invalid_token} #{e.message}")
# )
# end
