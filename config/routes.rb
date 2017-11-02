Rails.application.routes.draw do
  root 'podcasts#index'
  resources :podcasts do
    get :download
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
