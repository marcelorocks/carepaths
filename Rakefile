# frozen_string_literal: true

require File.expand_path('config/application', __dir__)
Rails.application.load_tasks

if %w[development test].include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task(:default).clear
  task default: %i[rubocop spec]
end
