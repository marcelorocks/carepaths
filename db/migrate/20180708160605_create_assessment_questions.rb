# frozen_string_literal: true

class CreateAssessmentQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :assessment_questions do |t|
      t.string :title
      t.integer :order_number
      t.timestamps
    end
  end
end
