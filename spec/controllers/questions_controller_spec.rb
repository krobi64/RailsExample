require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe '#sync_questions' do
    let!(:response) { get :sync_questions, format: :json }
    let!(:body) { JSON.parse response.body}

    it 'returns a list of unanswered questions' do
      expect(body).to be_an Array
    end

    it 'adds records to the db' do
      expect(Question.all.count).to eq body.size
    end
  end
end
