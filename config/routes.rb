# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :assessments do
    member do
      get :next
      get :disclaimer
      get :first_tooltip
      get :next_question
    end
  end
  resources :assessment_questions do
    member do
      get :answer
    end
  end
  resources :check_ins

  get '/dashboard', to: 'main#dashboard', as: :dashboard
  root to: 'main#index'
end
