# frozen_string_literal: true

class AssessmentQuestionsController < ApplicationController
  before_action :find_assessment
  before_action :find_assessment_question

  def show; end

  def answer
    @answer = AssessmentAnswer.find(params[:answer_id])
    current_user.user_assessment_answers.create!(
      assessment_answer: @answer,
      assessment: @assessment
    )
    @assessment.update_attributes(
      current_assessment_question: @assessment_question
    )

    redirect_to next_assessment_path(@assessment)
  end

  protected

  def find_assessment
    redirect_to root_path if session[:assessment_id].blank?
    @assessment = current_user.assessments.find(session[:assessment_id])
  end

  def find_assessment_question
    return if params[:id].blank?
    @assessment_question = AssessmentQuestion.find(params[:id])
  end
end
