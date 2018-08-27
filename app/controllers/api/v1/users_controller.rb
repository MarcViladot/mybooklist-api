module Api
  module V1
    class UsersController < ApplicationController

      before_action :authenticate_confirmed_user, only: [:index]
      before_action :authenticate_request, only: [:follow, :unfollow]

      def index
        if params[:me].present?
          user = User.find(@current_user.id)
        end
          render json: user
      end

      api :POST, "/v1/users", "Sign up"
      param :email, String, :required => true
      param :username, String, :required => true
      param :password, String, :required => true
      param :password_confirmation, String, :required => true
      def create
        @user = User.new(user_params)    
        if @user.save
          UserMailer.registration_confirmation(@user).deliver
          render json: {status: 'SUCCESS', message:'User Created'},status: :ok
        else
          render json: {status: 'ERROR', message:@user.errors},status: :unprocessable_entity
        end
      end

      def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
          Please sign in to continue."
          redirect_to signin_url
        else
          flash[:error] = "Sorry. User does not exist"
          redirect_to root_url
        end
      end

      def destroy
      end

      api :POST, "/v1/users/follow/:user_id", "Follow user"
      param :user_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def follow
        @current_user.follow(params[:user_id])
      end

      api :DELETE, "/v1/users/unfollow/:user_id", "Unfollow user"
      param :user_id, :number, :required => true
      header 'Authorization', 'Auth header', :required => true
      def unfollow
        @current_user.unfollow(params[:user_id])
      end

      api :GET, "/v1/users/:id", "Show user"
      param :id, :number, :required => true
      def show
        @user = User.find(params[:id])
      end

      def update
        
      end


      private

      def user_params
        params.permit(:email, :username, :password, :password_confirmation, :gender, :born)
      end

    end
  end
end