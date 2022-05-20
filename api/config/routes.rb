Rails.application.routes.draw do
  get 'health_check', to: 'health_check#index'

  resources :companies, only: %i[index]
  resources :athletics, only: %i[index]
  resources :culutures, only: %i[index]
  resources :arts, only: %i[index]
end
