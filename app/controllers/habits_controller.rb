class HabitsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]

    def index
        habits = Habit.all
        render json: habits
    end

    def show 
        habit = Habit.find_by(id: params[:id])
        render json: habit
    end 

    def create
        habit = Habit.create(habit_params)
        # render json: { habit: HabitSerializer.new(habit)}, status: :created
        render json: habit
    end

    def update
        habit = Habit.find_by(id: params[:id])
        if habit.update(habit_params)
            render json: habit
        else 
            render json: { error: 'failed to edit habit' }, status: :not_acceptable
        end 
    end 

    def destroy
        habit = Habit.find_by(id: params[:id])
        habit.destroy
        render json: {message: "Your habit has been deleted"}
    end 

    private
   
    def habit_params
        params.require(:habit).permit(:name, :user_id)
    end    
end
