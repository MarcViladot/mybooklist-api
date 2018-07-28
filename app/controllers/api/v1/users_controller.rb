module Api
  module V1
    class UsersController < ApplicationController

      def index
        
      end

      api :POST, "/v1/users", "Sign up"
      param :email, String, :required => true
      param :username, String, :required => true
      param :password, String, :required => true
      param :password_confirmation, String, :required => true
      def create
        user = User.new(user_params)
        if user.save
          render json: 'user'
        else 
          render josn: user.errors
        end
      end

      def destroy
        
      end

      def show
        
      end

      def update
        
      end


      private

      def user_params
        params.permit(:email, :username, :password, :password_confirmation)
      end

    end
  end
end