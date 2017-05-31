Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index' #sets default home page 

end
