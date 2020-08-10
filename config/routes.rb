Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :show] do
    post :assign, on: :collection
  end
end
