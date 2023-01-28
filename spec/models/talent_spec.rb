require 'rails_helper'

RSpec.describe Talent, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:courses) }
    it { should have_many(:own_courses).class_name('Course') }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
