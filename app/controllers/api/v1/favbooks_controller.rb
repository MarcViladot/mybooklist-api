module Api
  module V1
    class FavbooksController < ApplicationController

      api :GET, "/v1/favbooks", "Show all the users-books relationships"
      def index
        fav = Favbook.all
        render json: fav
      end

      api :POST, "/v1/favbooks", "Add favourite book to user"
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def create
        fav = Favbook.new(favbook_params)
        if fav.save
        	render json: fav
        else
        	render json: fav.errors
        end
      end

      api :GET, "/v1/favourite-user-book/:user_id/:book_id", "Show a Favourite by user_id and book_id"
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def show_by_user_book
        fav = Favbook.find_by(user_id: params[:user_id], book_id: params[:book_id])
        render json: fav
      end

      api :DELETE, "/v1/favbooks/:id", "Remove book from user favourites"
      param :id, :number, :required => true
      def destroy
        fav = Favbook.find(params[:id])
        fav.destroy
        render json: fav
      end

      api :GET, "/v1/favbooks/:id", "Show a user-author relationships"
      param :id, :number, :required => true
      def show
        fav = Favauthor.find(params[:id])
        render json: fav
      end

      def update
        fav = Favbook.find(params[:id])
        if fav.update_attributes(favbook_params)
        	render json: fav
        else
    		  render json: fav.errors
        end
      end

      private

      def favbook_params
        params.permit(:user_id, :book_id)
      end

    end
  end
end