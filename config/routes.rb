Rails.application.routes.draw do
  root :to => 'post#index'

  resources :posts do
    resources :comments
  end

end
