class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
    end

    def destroy
    end

    private

    def user_params
      params.require(:user).permit(:email, :username, :first_name, :last_name, :password)
    end
end
