class Customer < ApplicationRecord
  # has_many :notes
  validates :name, presence: true
  validates :phone_number, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: "format must be xxx-xxx-xxxx" }

  def number_and_name
    "#{phone_number}: #{name}"
  end
end
