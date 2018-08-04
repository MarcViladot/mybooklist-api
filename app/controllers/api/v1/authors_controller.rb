module Api
  module V1
    class AuthorsController < ApplicationController

      api :GET, '/v1/authors', "Show all the authors"
      def index
        @authors = Author.all
      end

      def create
        
      end

      def destroy
        
      end

      def show
        
      end

      def update
        
      end


      private

      def author_params
        params.permit(:name, :born)
      end

    end
  end
end