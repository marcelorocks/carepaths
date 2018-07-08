# frozen_string_literal: true

class CheckInsController < ApplicationController
  before_action :authenticate_user!

  def index
    @check_ins = current_user.check_ins
  end

  def new
    @check_in = current_user.check_ins.new
  end

  def create
    @check_in = current_user.check_ins.new(check_in_params)
    if @check_in.valid?
      @check_in.save
      redirect_to check_ins_path, notice: 'Your daily check-in has been saved.'
    else
      render :new
    end
  end

  protected

  def check_in_params
    params.require(:check_in).permit(:question)
  end
end
