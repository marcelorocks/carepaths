# frozen_string_literal: true

module ApplicationHelper
  def assessment_types
    [
      ['... or select specific measure', ''],
      [
        'AAQ2: Acceptance &amp; Action Questionnaire AAQ-II 2.0 (10 items)',
        'aaq2'
      ],
      [
        'AAQ2-7: Acceptance &amp; Action Questionnaire AAQ-II 2.0 (7 items)',
        'aaq2_7'
      ]
    ]
  end
end
