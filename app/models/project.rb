class Project < ApplicationRecord
  has_many :assignments
  validates :name, presence: true
end
