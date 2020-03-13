class SessionsController < ApplicationController

    def new
      @user = User.new
      @users = User.all
    end
  
    def create
      @user = User.find_by(email: params[:email])
      if @user
        session[:user_id] = @user.id
        redirect_to user_leads_url(@user)
      else
        render :new
      end
    end
  
    def create_oath
      puts auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['nickname']
        u.email = auth['info']['email']
      end
      @user.save!(:validate => false)
      session[:user_id] = @user.id
      redirect_to user_leads_url(@user)
    end
  
  
    def destroy
      User.find(session[:user_id]).destroy      
      session[:user_id] = nil   
      redirect_to root_url
    end
  
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
      def auth
        request.env["omniauth.auth"]
      end
  end