Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace 'api' do
      namespace 'v1' do
        resources :books
        resources :addeds
        resources :series
        resources :genres
        resources :reviews
        resources :favbooks
        resources :favauthors
        resources :genrebooks
        resources :users
        resources :authors

        #Auth
        post 'authenticate', to: 'authentication#authenticate'

        #Addeds
        get 'score/:book_id', to: 'addeds#show_score'
        get 'scores/:book_id', to: 'addeds#show_scores'
        get 'list/:user_id', to: 'addeds#show_list'
        get 'addeds-user-book/:user_id/:book_id', to: 'addeds#show_by_user_book'

        #Reviews
        get 'reviews/book/:book_id', to: 'reviews#show_by_book'
        get 'reviews/show/latest', to: 'reviews#show_latest'

        #User
        get 'users/params', to: 'users#show_login_params'

        #Book
        get 'books/show/latest', to: 'books#show_latest'
        get 'books/show/search/:search', to: 'books#show_search'

        #Favbooks
        get 'favourite-user-book/:user_id/:book_id', to: 'favbooks#show_by_user_book'

      end
  end
end