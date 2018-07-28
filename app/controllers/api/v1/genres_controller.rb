module Api
  module V1
    class GenresController < ApplicationController

      api :GET, "/v1/genres", "Show all the genres"
      def index
        genres = Genre.all
        render json: genres
      end

      api :POST, "/v1/reviews", "Create a Genre"
      param :genre, String, :required => true
      def create
        genre = Genre.new(genre_params)
        if genre.save
          render json: genre
        else
          render json: genre.errors
        end
      end

      api :DELETE, "/v1/genres/:id", "Delete a genre"
      param :id, :number, :required => true
      def destroy
        genres = Genre.find(params[:id])
        genres.destroy
        render json: genres
      end

      api :GET, "/v1/genres/:id", "Show a genre"
      param :id, :number, :required => true
      def show
        genres = Genre.find(params[:id])
        render json: genres
      end

      api :POST, "/v1/reviews/:id", "Update a Genre"
      param :id, :number, :required => true
      param :genre, String, :required => true
      def update
        genre = Genre.find(params[:id])
        if genre.update_attributes(genre_params)
          render json: genre
        else
          render json: genre.errors
        end
      end

      private

      def genre_params
        params.permit(:genre)
      end

    end
  end
end