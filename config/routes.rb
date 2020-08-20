Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :show] do
    member do
      put :assign
      put :unassign
    end

    resources :tasks, only: [:create, :index] do
      collection do
        get :assigned
      end
      member do
        put :assign
        put :unassign
      end
    end
  end
end
