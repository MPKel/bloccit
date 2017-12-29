Rails.application.routes.draw do

  # get 'sponsored_posts/show'
  #
  # get 'sponsored_posts/new'
  #
  # get 'sponsored_posts/edit'

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
    resources :sponsored_posts, except: [:index]
  end



  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'

end
