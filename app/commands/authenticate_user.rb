class AuthenticateUser
  prepend SimpleCommand

   def initialize(email, password)
     @email = email
     @password = password
   end

# Service entry point
   def call
     JsonWebToken.encode(user_id: user.id) if user
   end

   private

   attr_accessor :email, :password

# verify user credentials
   def user
     user = Student.find_by_email(email)
     return user if user && user.authenticate(password)
     # raise Authentication error if credentials are invalid
     #raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
     errors.add :user_authentication, 'Invalid credentials'
     nil
   end
 end