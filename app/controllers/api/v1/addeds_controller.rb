module Api
  module V1
    class AddedsController < ApplicationController

      api :GET, "/v1/addeds", "Show all the addeds"
      def index
        addeds = Added.all
        render json: addeds
      end

      api :POST, "/v1/addeds", "Add a book to user list"
      param :status, ["Reading", "Completed", "On-hold", "Dropped", "Plan to Read"], :required => true
      param :progress, :number, :required => true
      param :score, :number, :required => true
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def create
        added = Added.new(added_params)
        if added.save
          render json: added
        else
          render json: added.errors
        end
      end

      api :DELETE, "/v1/addeds/:id", "Delete a book from user list"
      param :id, :number, :required => true
      def destroy
        added = Added.find(params[:id])
        added.destroy
        render json: added
      end

      api :GET, "/v1/addeds/:id", "Show a Added"
      param :id, :number, :required => true
      def show
        added = Added.find(params[:id])
        render json: added
      end

      api :GET, "/v1/addeds-user-book/:user_id/:book_id", "Show a Added"
      param :user_id, :number, :required => true
      param :book_id, :number, :required => true
      def show_by_user_book
        added = Added.find_by(user_id: params[:user_id], book_id: params[:book_id])
        render json: added
      end

      api :GET, "/v1/score/:book_id", "Show score of the book"
      param :book_id, :number, :required => true
      def show_score
      	addeds = Added.where("book_id = ? and score != 0", params[:book_id])
      	begin
      		render json: addeds.sum('score')/addeds.count.to_f
      	rescue
      		render json: 0
      	end
      end

      api :GET, "/v1/scores/:book_id", "Show percentages of book scores"
      param :book_id, :number, :required => true
      def show_scores
      	# scores = Hash.new
      	@addeds = Added.where("book_id = ? and score != 0", params[:book_id])
      	# 1.upto(10) do |i|
      	# 	score_x = addeds.where("score = ?", i)
      	# 	scores[i] = 0
      	# 	scores[i] = score_x.count/addeds.count.to_f * 100 unless score_x.blank?
      	# end
      	# render json: scores
      end

      api :GET, "/v1/list/:user_id", "Show user book list"
      param :user_id, :number, :required => true
      def show_list
      	added_status = ["Reading", "Completed", "On-hold", "Dropped", "Plan to Read"]
      	list = Hash.new
      	addeds = Added.where("user_id = ?", params[:user_id])
      	added_status.each do |x|
      		list[x] = addeds.where("status = ?", x)
      	end
      	render json: list.to_json(:include => [:book => {:only => [:id, :name, :cover, :pages]}])
      end

      api :PUT, "/v1/addeds/:id", "Update Added"
      param :status, ["Reading", "Completed", "On-hold", "Dropped", "Plan to Read"]
      param :progress, :number
      param :score, :number
      def update
        added = Added.find(params[:id])
        if added.update_attributes(added_params)
          render json: added
        else
          render json: added
        end
      end


      private

      def added_params
        params.permit(:status, :progress, :score, :user_id, :book_id)
      end

    end
  end
end