class CourseResource < JSONAPI::Resource
  attributes :title, :author_id
  has_many :talents

  def self.creatable_fields(_)
    [:title, :author_id]
  end
end
