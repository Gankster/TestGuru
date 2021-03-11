# frozen_string_literal: true

class PassingTest < ApplicationRecord
  VALUE_FOR_PASSAGE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  def test_passed?
    result_percent >= VALUE_FOR_PASSAGE
  end

  def result_percent
    (100 * correct_questions) / test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_number
    test.questions.count - next_questions.count
  end

  private

  def before_save_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    next_questions.first
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
