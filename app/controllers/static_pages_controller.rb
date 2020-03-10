class StaticPagesController < ApplicationController

    def home
    end
  
    private
  
    helper_method :set_user
      def set_user
        @user = User.find(session[:user_id])
      end
  end