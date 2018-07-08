# frozen_string_literal: true

class CheckIn < ApplicationRecord
  belongs_to :user

  before_save :load_answer

  def load_answer
    self.answer ||= 'Comment'
  end
end
