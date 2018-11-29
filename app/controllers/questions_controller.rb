class QuestionsController < ApplicationController
  before_action :retrieve_questions, only: :sync_questions

  def sync_questions
    answered_questions, unanswered_questions = sort_questions
    answered_ids = answered_questions.map {|q| q[:question_id]}
    Question.set_answered answered_ids
    unanswered_questions.each do |question|
      attributes = question.slice('question_id', 'tags', 'is_answered', 'answer_count', 'score', 'creation_date', 'link', 'title')
      Question.where(question_id: question['question_id']).first_or_create! attributes
    end
    render json: unanswered_questions
  end

  def purge_answered_questions
    Question.answered.delete_all
    respond_with :ok
  end

  private
  def retrieve_questions
    @questions ||= JSON.parse(client.questions)['items']
  end

  def sort_questions
    unanswered_questions = []
    answered_questions = []

    @questions.each do |q|
      q['is_answered'] ? answered_questions.push(q) : unanswered_questions.push(q)
    end
    [answered_questions, unanswered_questions]
  end

  def client
    ApiStackExchange.new
  end
end
