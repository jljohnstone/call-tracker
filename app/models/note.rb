class Note < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:content]
  belongs_to :customer
  belongs_to :user, optional: true
  validates :content, presence: true
end
