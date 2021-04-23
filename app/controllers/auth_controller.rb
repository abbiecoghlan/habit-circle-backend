class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :profile]
    
      def create
        @user = User.find_by(username: user_login_params[:username])

        #CHECK IF THE USER IS VALID
        if @user && @user.authenticate(user_login_params[:password])
          
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end
    
    def profile 
      @user = current_user 
      if @user
        render json: { user: UserSerializer.new(@user) }, status: :accepted
      else 
        render json:{ message: "Unable to authorize user"}
      end 
    end   


      private
    
      def user_login_params
        params.require(:user).permit(:username, :password)
      end
    end 
    