class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]


    def index
        users = User.all
        render json: users
    end

    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end 

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            render json: user
        else 
            render json: { error: 'failed to update user account' }, status: :not_acceptable
        end 
    end 

    # def current_month
    #   user = User.find_by(id: params[:id])
    #   user.progresses.select {|p| p.day.month == Time.now.month && p.day.year == Time.now.year}
    # end 


    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: {message: "Your account has been deleted"}
    end 
    
      private
    
      def user_params
        params.require(:user).permit(:username, :password, :name)
      end

end