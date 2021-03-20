class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]
    
      def create

        @user = User.find_by(username: user_login_params[:username])

        #CHECK IF THE USER IS VALID
        if @user && @user.authenticate(user_login_params[:password])
            #CHECK IF THE USER HAS PROGRESS FOR THEIR HABITS FOR THIS MONTH- IF THEY DONT, MAKE THEM
            if @user.progresses.any?{|p| p.day.month == Time.now.month && p.day.year == Time.now.year} == false
                Day.all.select { |day| day.month == Time.now.month && day.year == Time.now.year}.each { |day| 
                @user.habits.each { |habit| 
                    Progress.create(habit_id: habit.id, day_id: day.id, completed: false)
                    }
                }
            end               
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end
    
      private
    
      def user_login_params
        params.require(:user).permit(:username, :password)
      end
    end 
    