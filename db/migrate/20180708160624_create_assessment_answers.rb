# frozen_string_literal: true

class CreateAssessmentAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :assessment_answers do |t|
      t.integer :assessment_question_id
      t.string :answer
      t.integer :order_number
      t.timestamps
    end
  end
end
