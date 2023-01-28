class Talent < ApplicationRecord
  has_and_belongs_to_many :courses

  has_many :own_courses, class_name: 'Course',
           foreign_key: :author_id, inverse_of: :author

  validates :first_name, :last_name, presence: true
end
