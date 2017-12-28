Rails.application.routes.draw do

  # get 'questions/index'
  #
  # get 'questions/show'
  #
  # get 'questions/new'
  #
  # get 'questions/edit'

  resources :questions
  resources :topics do
    resources :posts, except: [:index]
  end



  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'

end
