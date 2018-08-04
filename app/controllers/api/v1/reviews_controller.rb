module Api
  module V1
    class ReviewsController < ApplicationController

      api :GET, "/v1/reviews", "Show all the reviews"
      def index
        reviews = Review.all
        render json: reviews
      end

      api :POST, "/v1/reviews", "Add a Review to book"
      param :text, String, :required => true
      param :score, :number, :required => true
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def create
        review = Review.new(review_params)
        if review.save
          render json: review
        else
          render json: review.errors
        end
      end

      api :DELETE, "/v1/reviews/:id", "Delete a review"
      param :id, :number, :required => true
      def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: review
      end

      api :GET, "/v1/reviews/:id", "Show a review"
      param :id, :number, :required => true
      def show
        review = Review.find(params[:id])
        render json: review
      end

      api :GET, "/v1/reviews/book/:book_id", "Show all the reviews of the book"
      param :book_id, :number, :required => true
      def show_by_book
        reviews = Review.where("book_id = ?", params[:book_id])
        render json: reviews
      end

      api :GET, "/v1/reviews/show/latest", "Show the last 5 reviews"
      def show_latest
        reviews = Review.order("created_at DESC").limit(5)
        render json: reviews
      end

      api :PUT, "/v1/reviews/:id", "Add a book to user list"
      param :id, :number, :required => true
      param :text, String
      param :score, :number
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def update
        review = Review.find(params[:id])
        if review.update_attributes(review_params)
          render json: review
        else
          render json: review.errors
        end
      end

      private

      def review_params
        params.permit(:text, :score, :user_id, :book_id)
      end

    end
  end
end