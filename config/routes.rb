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

      	#Auth
      	post 'authenticate', to: 'authentication#authenticate'

      	#Addeds
      	get 'score/:book_id', to: 'addeds#show_score'
      	get 'scores/:book_id', to: 'addeds#show_scores'
      	get 'list/:user_id', to: 'addeds#show_list'

      	#Reviews
      	get 'reviews/book/:book_id', to: 'reviews#show_by_book'

        #User
        get 'users/params', to: 'users#show_login_params'

  		end
	end
end
