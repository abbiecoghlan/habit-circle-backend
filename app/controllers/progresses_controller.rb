class ProgressesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy, :user_info]

    def user_info
        user = User.find_by(id: params[:id])
        progresses = user.progresses.select {|p| p.habit.user.id == params[:id] && p.day.month == params[:currentMonth]} 
        render json: progresses
    end 

    def index
        progresses = Progress.all

        render json: progresses
    end

    def show
        progress = Progress.find_by(id: params[:id])
        
        render json: progress
    end

    def create
        
        progress = Progress.create(progress_params)
        progress.save
        # add validations
        render json: progress
    end

    def update

        progress = Progress.find_by(id: params['id'])
        #possibly add conditional logic here to toggle the completed value
        progress.status = params['completed']
        progress.save

        render json:progress
    end


    def progress_params
        params.require(:progress).permit(:day_id, :habit_id, :completed) 
    end 

    #add strong params

end
