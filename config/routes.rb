Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  root 'welcome#index' #sets default home page (here: implied hash syntax, otherwise: root({to: 'welcome#index'}))

end
