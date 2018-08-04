module Api
  module V1
    class SeriesController < ApplicationController

      api :GET, "/v1/series", "Show all the series"
      def index
        series = Serie.all
        render json: series
      end

      api :POST, "/v1/series", "Add a Serie"
      param :name, String, :required => true
      def create
        serie = Serie.new(serie_params)
        if serie.save
          render json: serie
        else
          render json: serie.errors
        end
      end

      api :DELETE, "/v1/series/:id", "Delete a serie"
      param :id, :number, :required => true
      def destroy
        serie = Serie.find(params[:id])
        serie.destroy
        render json: serie
      end 

      api :DELETE, "/v1/series/:id", "Show a serie"
      param :id, :number, :required => true
      def show
        serie = Serie.find(params[:id])
        render json: serie
      end

      api :POST, "/v1/series/:id", "Update a Serie"
      param :id, :number, :required => true
      param :name, String, :required => true
      def update
         serie = Serie.find(params[:id])
        if serie.update_attributes(serie_params)
          render json: serie
        else
          render json: serie.errors
        end
      end

      private

      def serie_params
        params.permit(:name)
      end

    end
  end
end