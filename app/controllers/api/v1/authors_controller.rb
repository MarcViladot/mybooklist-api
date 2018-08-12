module Api
  module V1
    class AuthorsController < ApplicationController

      api :GET, '/v1/authors', "Show all the authors"
      def index
        @authors = Author.all
      end

      def create
        author = Author.new(author_params)
        if author.save
          render json: author
        else
          render json: author.errors
        end
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy
        render json: author
      end

      def show
        @author = Author.find(params[:id])
      end

      def update
        author = Author.find(params[:id])
        if author.update_attributes(author_params)
          render json: author
        else
          render json: author
        end
      end


      private

      def author_params
        params.permit(:name, :born)
      end

    end
  end
end