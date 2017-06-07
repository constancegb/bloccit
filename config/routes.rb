Rails.application.routes.draw do

  resources :advertisements

  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index' #sets default home page

end
