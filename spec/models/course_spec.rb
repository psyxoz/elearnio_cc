require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('Talent').required }
    it { should have_and_belong_to_many(:talents) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
