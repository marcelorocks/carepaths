# frozen_string_literal: true

class UserAssessmentAnswer < ApplicationRecord
  belongs_to :assessment
  belongs_to :assessment_answer
  belongs_to :user
end
