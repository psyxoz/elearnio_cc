require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'POST /courses' do
    before do
      post '/courses',
           params: { data: { type: "courses", attributes: attributes } },
           headers: { 'Accept' => JSONAPI::MEDIA_TYPE, 'Content-Type' => JSONAPI::MEDIA_TYPE },
           as: :json
    end

    context 'with valid parameters' do
      let!(:author) { create(:talent) }
      let!(:attributes) do
        {
          title: "Test course",
          author_id: author.id,
        }
      end

      it 'successful' do
        expect(response).to have_http_status(:created)

        new_course = JSON.parse(response.body)["data"]["attributes"]
        expect(new_course["title"]).to eq("Test course")
        expect(new_course["author_id"]).to eq(author.id)
      end
    end

    context 'with invalid parameters' do
      let!(:attributes) do
        {
          title: "",
          author_id: nil
        }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end