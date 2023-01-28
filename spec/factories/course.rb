FactoryBot.define do
  factory :course do
    title { "Test course" }
    association :author, factory: :talent
  end
end