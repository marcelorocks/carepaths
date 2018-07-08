# frozen_string_literal: true

class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :current_assessment_question,
             class_name: 'AssessmentQuestion',
             required: false
  has_many :user_assessment_answers

  before_save :load_status

  def load_status
    self.status ||= 'disclaimer'

    return unless user_assessment_answers.count == AssessmentQuestion.count
    self.status = 'completed'
  end

  def next_question
    @next_question ||= AssessmentQuestion
                       .where('order_number > ?', current_order_number)
                       .order(order_number: :asc)
                       .first
  end

  def current_order_number
    current_assessment_question.try(:order_number).to_i
  end

  def completed?
    status == 'completed'
  end
end
