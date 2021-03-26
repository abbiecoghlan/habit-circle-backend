class ProgressesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy, :user_info]

    ## add in logic to include year query
    def user_info
        user = User.find_by(id: params[:id])
        progresses = user.progresses.select {|p| p.habit.user.id == params[:id]} 
            
        render json: progresses
    end

    # def user_progress
    #     user = User.find_by(id: params[:id])
    #     progresses = user.progresses.select {|p| p.habit.user.id == params[:id]} 
            
    #     render json: progresses
    # end

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
        progress = Progress.find_by(id: params[:id])
        if progress.update(progress_params)
            render json: progress
        else 
            render json: { error: 'failed to edit habit' }, status: :not_acceptable
        end 

    end


    def progress_params
        params.require(:progress).permit(:day_id, :habit_id, :completed) 
    end 

    #add strong params

end
