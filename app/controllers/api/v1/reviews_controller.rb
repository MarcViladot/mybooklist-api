module Api
  module V1
    class ReviewsController < ApplicationController

      before_action :authenticate_request, only: [:create, :update, :show_by_user_book]

      api :GET, "/v1/reviews", "Show all the reviews"
      def index
        reviews = Review.all
        render json: reviews
      end

      api :POST, "/v1/reviews", "Add a Review to book"
      param :text, String, :required => true
      param :score, :number, :required => true
      param :book_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def create
        review = Review.new(review_params)
        if review.save
          render json: review
        else
          render json: review.errors
        end
      end

      api :POST, "/v1/reviews/upvote/:review_id", "Upvote Review"
      param :review_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def upvote
        voted = ReviewVote.create(params.permit(:review_id).merge(user_id: @current_user.id))
        if voted.save
          render json: voted
        else
          render json: voted.errors
        end
      end
      
      api :DELETE, "/v1/reviews/downvote/:review_id", "Downvote Review"
      param :review_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def downvote
        voted = ReviewVote.find_by(user_id: @current_user.id, review_id: params[:review_id])
        voted.destroy
        render json: voted
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

      api :GET, "/v1/reviews/user-book/:book_id", "Show a Review by user_id and book_id"
      param :book_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def show_by_user_book
        fav = Review.find_by(user_id: @current_user.id, book_id: params[:book_id])
        render json: fav
      end

      api :GET, "/v1/reviews/book/:book_id", "Show all the reviews of the book"
      param :book_id, :number, :required => true
      def show_by_book
        @reviews = Review.where("book_id = ?", params[:book_id])
        # render json: reviews
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
      header 'Authorization', 'Auth header', :required => true
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
        params.permit(:text, :score, :book_id).merge(user_id: @current_user.id)
      end

    end
  end
end