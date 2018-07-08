# frozen_string_literal: true

class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_assessment

  def index
    @assessments = current_user.assessments
  end

  def new
    @assessment = current_user.assessments.create!
    redirect_to next_step_for(@assessment)
  end

  def next
    redirect_to next_step_for(@assessment)
  end

  def disclaimer
    @assessment.update_attributes(status: 'first_tooltip')
  end

  def first_tooltip
    @assessment.update_attributes(status: 'questions')
  end

  def next_question
    redirect_to assessment_question_path(@assessment.next_question)
  end

  protected

  def find_assessment
    return unless params[:id].present?
    @assessment = current_user.assessments.find(params[:id])
    session[:assessment_id] = @assessment.id
  end

  def next_step_for(assessment)
    case assessment.status
    when 'disclaimer'
      disclaimer_assessment_path(assessment)
    when 'first_tooltip'
      first_tooltip_assessment_path(assessment)
    when 'questions'
      next_question_assessment_path(assessment)
    when 'completed'
      assessments_path
    end
  end
end
