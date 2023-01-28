class TalentResource < JSONAPI::Resource
  attributes :first_name, :last_name
  attribute :full_name
  has_many :courses

  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end
end
