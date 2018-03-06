class Student < ApplicationRecord
  has_secure_password

  belongs_to :university, optional: true
  belongs_to :ej, optional: true

  validates :name, presence: true, length: { in: 2..30 }
  validates :surname, presence: true, length: {in: 2.. 40 }
  validates :email, presence: true, length: { in: 4 .. 40 }, uniqueness: true,
   format: { with: /\A[a-z]{2,30}\w\@id.uff.br\z/,
    message: "Insira um email nome@id.uff.br"}
  validates :password, length: { in: 6..16 }, allow_nil: true

end
