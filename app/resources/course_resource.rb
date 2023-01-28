class CourseResource < JSONAPI::Resource
  attributes :title, :author_id
  has_many :talents
end
