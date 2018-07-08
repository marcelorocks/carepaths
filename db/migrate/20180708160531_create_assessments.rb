# frozen_string_literal: true

class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.string :status
      t.integer :current_assessment_question_id

      t.timestamps
    end
  end
end
