class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Your account has been created successfully"
        session[:user_id] = @user.id
        redirect_to locations_path
      else
        render 'new'
      end
    end

    def update
      if @user.update(user_params)
        flash[:success] = "Your profile has been updated succesfully"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end
    end

    def destroy
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:email, :username, :first_name, :last_name, :password)
    end
end
