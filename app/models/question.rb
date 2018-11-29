class Question < ApplicationRecord
  scope :unanswered, -> { where(is_answered: false) }
  scope :answered, -> { where(is_answered: true) }
  scope :score, -> (score) { where("score >= ?", score)}

  def self.set_answered(question_ids=[])
    Question.where(question_id: Array.wrap(question_ids)).update_all({
      is_answered: true
    })
  end

  def tags=(tags=[])
    @tags = Array.wrap(tags).join(',')
  end

  def tags
    @tags.respond_to?(:split) ? @tags.split(',') : @tags
  end

end
