module Api
  module V1
    class GenrebooksController < ApplicationController

      def index
        genrebooks = Genrebooks.all
        render json: genrebooks
      end

      def create
        genrebook = Genrebooks.new(genrebook_params)
        if genrebook.save
        	render json: genrebook
        else
        	render json: genrebook.errors
        end
      end

      def destroy
        genrebook = find(params[:id])
        genrebook.destroy
        render json: genrebook
      end

      def show
        genrebook = find(params[:id])
        genrebook.destroy
        render json: genrebook
      end

      def update
        genrebook = find(params[:id])
        if genrebook.update_attributes(genrebook_params)
        	render json: genrebook
        else 
        	render json: genrebook.errors
        end
      end


      private

      def genrebook_params
        params.permit(:genre_id, :book_id)
      end

    end
  end
end