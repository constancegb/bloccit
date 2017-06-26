Rails.application.routes.draw do

  resources :topics do
     resources :posts, except: [:index]
  end
#we use only: [] because don't want to create any /posts/:id routes, just posts/:post_id/comments routes
  resources :posts, only: [] do
     resources :comments, only: [:create, :destroy] #only add create and destroy routes (no need for more because get displayed on post show view or other)
     resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index' #sets default home page

end
