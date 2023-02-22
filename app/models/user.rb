class User < ApplicationRecord
  include Clearance::User
  # has_many :notes
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
