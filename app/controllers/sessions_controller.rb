class SessionsController < ApplicationController
    def create
        user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
        if user
            session[:user_id] = user.id
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end