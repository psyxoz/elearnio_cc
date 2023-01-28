require 'rails_helper'

RSpec.describe 'Talents', type: :request do
  describe 'DELETE /talents/:id' do
    let(:talent) { create(:talent) }
    let(:params) { {} }

    subject do
      delete "/talents/#{talent.id}",
             params: params,
             headers: { 'Accept' => JSONAPI::MEDIA_TYPE, 'Content-Type' => JSONAPI::MEDIA_TYPE },
             as: :json
    end

    it "successful" do
      expect(subject).to eq(204)
      expect { talent.reload }.to raise_exception(ActiveRecord::RecordNotFound)
    end

    context 'transfer courses to another author' do
      let!(:courses) { create_list(:course, 3, author: talent) }
      let(:another_talent) { create(:talent) }
      let(:params) { { new_author_id: another_talent.id } }

      it 'successful' do
        expect(subject).to eq(204)
        expect { talent.reload }.to raise_exception(ActiveRecord::RecordNotFound)

        courses.each do |course|
          expect(course.reload.author_id).to eq(another_talent.id)
        end
      end
    end
  end
end