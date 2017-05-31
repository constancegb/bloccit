Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/faq'

  root 'welcome#index' #sets default home page

end
