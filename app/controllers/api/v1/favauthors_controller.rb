module Api
  module V1
    class FavauthorsController < ApplicationController

      before_action :authenticate_request, only: [:create, :show_by_user_author, :update]

      api :GET, "/v1/favauthors", "Show all the users-authors relationships"
      def index
        fav = Favauthor.all
        render json: fav
      end

      api :POST, "/v1/favauthors", "Add favourite author to user"
      param :author_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def create
        fav = Favauthor.new(favauthor_params)
        if fav.save
        	render json: fav
        else
        	render json: fav.errors
        end
      end

      api :DELETE, "/v1/favauthors/:id", "Remove author from user favourites"
      param :id, :number, :required => true
      def destroy
        fav = Favauthor.find(params[:id])
        fav.destroy
        render json: fav
      end

      api :GET, "/v1/favourite-user-author/:user_id/:author_id", "Show a Favourite by user_id and book_id"
      param :author_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def show_by_user_author
        fav = Favauthor.find_by(user_id: @current_user.id, author_id: params[:author_id])
        render json: fav
      end

      api :GET, "/v1/favauthors/:id", "Show a user-author relationships"
      param :id, :number, :required => true
      def show
        fav = Favauthor.find(params[:id])
        render json: fav
      end
      
      api :PUT, "/v1/addeds/:id", "Update Favourite"
      param :author_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def update
        fav = Favauthor.find(params[:id])
        if fav.update_attributes(favauthor_params)
          render json: fav
        else
    		  render json: fav.errors
        end
      end


      private

      def favauthor_params
        params.permit(:author_id).merge(user_id: @current_user.id)
      end

    end
  end
end