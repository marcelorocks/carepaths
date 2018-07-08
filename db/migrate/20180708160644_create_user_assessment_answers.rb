# frozen_string_literal: true

class CreateUserAssessmentAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_assessment_answers do |t|
      t.integer :assessment_id
      t.integer :assessment_answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
