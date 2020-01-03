class UsersController < ApplicationController

    def index
        users = User.all
        render json:users
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: user
        else
            render json:{message: "Please choose another Username"}
        end
    end

    def notes
        user= User.find(params[:id])
        render json: user.notes, include: :tags
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
