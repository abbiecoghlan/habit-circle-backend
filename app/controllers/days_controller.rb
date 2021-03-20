class DaysController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]
    def index
        days = Day.all
        render json: days
    end

    def show 
        day = Day.find_by(id: params[:id])
        render json: day
    end

end
