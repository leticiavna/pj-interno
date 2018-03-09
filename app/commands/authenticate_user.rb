
class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = Student.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Credencial inválida'
    nil
  end
end
