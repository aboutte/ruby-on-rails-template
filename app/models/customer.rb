# app/models/customer.rb
class Customer < ApplicationRecord
  # Fields: first_name, last_name, email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
