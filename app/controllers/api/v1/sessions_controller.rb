class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate


    def create
      user = User.find_by(email: auth_params[:email])
      if user.authenticate(auth_params[:password])
        jwt = Auth.issue({user: user.id})
        render json: {jwt: jwt}
      else
      end
    end
    
      def get_current_user
        if logged_in?
          render json: UserSerializer.new(current_user)
        else
          render json: {
            error: "No one logged in"
          }
        end
      end
    
      def destroy
        session.clear
        render json: {
          notice: "successfully logged out"
        }, status: :ok
      end

      private
      def auth_params
        params.require(:auth).permit(:email, :password)
      end

end
