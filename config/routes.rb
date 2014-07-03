TinymceFilemanager::Engine.routes.draw do
  resources :images, :only => [:index, :create,:destroy]
  resources :files, :only => [:index, :create,:destroy]
  root 'home#index'
end
