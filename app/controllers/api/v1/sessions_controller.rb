class Api::V1::SessionsController < ApplicationController

    def create
      if User.exists?(email: auth_params[:email])
        user = User.find_by(email: auth_params[:email])
        if user.authenticate(auth_params[:password])
        #jwt = Auth.issue({user: user.id})
          session[:user_id] = user.id
          render json: UserSerializer.new(user), status: :ok
        else
          render json: {
            error: 'Password incorrect. Please try again.'
          }
        end
      else
        render json: {
          error: 'No account associated with that email.  Try again or proceed to sign up.'
        }
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
          notice: "Successfully logged out"
        }, status: :ok
      end

      private
      def auth_params
        params.require(:auth).permit(:email, :password)
      end

end
