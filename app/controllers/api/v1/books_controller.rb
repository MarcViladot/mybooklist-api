module Api
  module V1
    class BooksController < ApplicationController

      before_action :authenticate_request, only: [:show_user]

      api :GET, '/v1/books', "Show all the books"
      def index
        @books = Book.all
      end

      api :POST, "/v1/books", "Create a book"
      param :name, String, :required => true
      param :year, :number, :required => true
      param :plot, String, :required => true
      param :lang, String, :required => true
      param :pages, :number, :required => true
      param :form, String
      param :cover, String, :required => true
      param :serie_id, :number
      def create
        book = Book.new(book_params)
        if book.save
          render json: book
        else
          render json: book.errors
        end
      end

      api :DELETE, '/v1/books/:id', "Delete a book"
      param :id, :number, :required => true
      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: book
      end

      api :GET, "/v1/books/show/latest", "Show the last 20 books added"
      def show_latest
        books = Book.order("created_at DESC").limit(20)
        render json: books
      end

      def show_search
        @books = Book.where("name like ?", "%" + params[:search] + "%")
      end

      api :GET, '/v1/books/:id', "Show books by genre"
      param :genre_id, :number, :required => true
      def show_genre
        @books = Book.where("id IN (SELECT book_id FROM genrebooks WHERE genre_id = " + params[:genre_id] + ")")
      end

      api :GET, '/v1/books/author/:author_id', "Show books by author"
      param :author_id, :number, :required => true
      def show_author
        @books = Book.where("id IN (SELECT book_id FROM authorbooks WHERE author_id = " + params[:author_id] + ")")
      end

      api :GET, '/v1/books/list/user', "Show books in user list"
      header 'Authorization', 'Auth header', :required => true
      def show_user
        books = Book.where("id IN (SELECT book_id FROM addeds WHERE user_id = " + @current_user.id.to_s + ")").order("name ASC")
        render json: books
      end

      api :GET, '/v1/books/:id', "Show a book"
      param :id, :number, :required => true
      def show
        @book = Book.find(params[:id])
      end

      api :PUT, "/v1/books", "Update a book"
      param :id, :number, :required => true
      param :name, String
      param :year, :number
      param :plot, String
      param :lang, String
      param :pages, :number
      param :form, String
      param :cover, String
      param :serie_id, :number
      def update
        book = Book.find(params[:id])
        if book.update_attributes(book_params)
          render json: book
        else
          render json: book.errors
        end
      end


      private

      def book_params
        params.permit(:name, :year, :plot, :lang, :pages, :form, :cover, :serie_id)
      end

    end
  end
end