module Api
  module V1
    class RecommendationsController < ApplicationController

      def index
        recs = Recommendation.all
        render json: recs
      end

      def create
        rec = Recommendation.new(recommendation_params)
        if rec.save
        	render json: rec
        else
        	render json: rec.errors
        end
      end

      def destroy
        rec = Recommendation.find(params[:id])
        rec.destroy
        render json: rec
      end

      def show_by_user_book
        rec = Recommendation.find_by(user_id: @current_user.id, recommended_id: params[:book_id])
        render json: rec
      end

      def show
        rec = Recommendation.find(params[:id])
        render json: rec
      end

      def show_latest
      	rec = Recommendation.all.order("created_at DESC").limit(5)
      	render json: rec
      end

      def update
        rec = Recommendation.find(params[:id])
        if rec.update_attributes(recommendation_params)
          render json: rec
        else
          render json: rec
        end
      end


      private

      def recommendation_params
        params.permit(:reasons, :recommended_id, :recommending_id).merge(user_id: @current_user.id)
      end

    end
  end
end