class University < ApplicationRecord
  has_many :students
  has_many :ejs
end
