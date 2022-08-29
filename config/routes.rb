Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies, only: [:index]
  resources :lists do
    resources :reviews, only: :create
    resources :bookmarks, only: %i[index new create]
  end
  resources :bookmarks, only: [:destroy]
end
