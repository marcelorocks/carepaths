# frozen_string_literal: true

class AssessmentQuestion < ApplicationRecord
  has_many :assessment_answers
end
