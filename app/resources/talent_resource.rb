class TalentResource < JSONAPI::Resource
  attributes :first_name, :last_name
  has_many :courses

  def self.creatable_fields(_)
    [:first_name, :last_name]
  end
end
