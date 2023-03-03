class Customer < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name, :phone_number]
  has_many :notes#, inverse_of: :customer
  validates :name, presence: true
  validates :phone_number, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: "format must be xxx-xxx-xxxx" }

  def number_and_name
    "#{phone_number}: #{name}"
  end

  def name_and_number
    "#{name}: #{phone_number}"
  end
end
