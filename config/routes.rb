Rails.application.routes.draw do
  get 'projects/test', action: :test, controller: 'test'
end
