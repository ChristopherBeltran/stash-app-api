class Api::V1::PasswordResetsController < ApplicationController

    def create
        user = User.find_by_email(params[:email])
        if user
          user.send_password_reset
          render json: {
              notice: 'Email sent with password reset instructions.'
          }
        else
          render json: {
            reset: 'No email associated with that account'
          }
        end
    end

      def edit
        @user = User.find_by_password_reset_token!(params[:id])
      end

      def update
        @user = User.find_by_password_reset_token!(params[:id])
        if @user.password_reset_sent_at < 2.hour.ago
          render json: {
              expired: 'Password reset has expired'
          }
        elsif @user.update(user_params)
          render json: {
              success: 'Password has been reset.'
          }
        else
          render json: {
            error: 'Password invalid, try again.'
          }
        end
      end
      
      private
        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
          params.require(:user).permit(:password)
        end


end
