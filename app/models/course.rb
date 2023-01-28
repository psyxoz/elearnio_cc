class Course < ApplicationRecord
  belongs_to :author, class_name: "Talent", required: true
  has_and_belongs_to_many :talents

  validates :title, presence: true
end
