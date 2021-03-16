# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
    sessions: 'users/sessions'
  }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :passing_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index

    root 'tests#index'
  end

  root 'tests#index'
end
