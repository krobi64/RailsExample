require 'rails_helper'

RSpec.describe Question, type: :model do

  describe '.unanswered' do
    before do
      create_list(:question, 5, is_answered: false)
      create_list(:question, 3, is_answered: true)
    end

    it 'returns records that are unanswered' do
      expect(Question.unanswered.count).to eq(5)
    end
  end

  describe '.answered' do
    before do
      create_list(:question, 5, is_answered: false)
      create_list(:question, 3, is_answered: true)
    end

    it 'returns records that are unanswered' do
      expect(Question.answered.count).to eq(3)
    end
  end

  describe '.set_answered' do
    before do
      create_list(:question, 5, is_answered: false)
    end
    it 'sets is_answered to true' do
      ids = Question.unanswered.pluck(:question_id)
      Question.set_answered ids
      expect(Question.answered.count).to eq(5)
    end
  end
end
