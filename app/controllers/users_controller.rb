class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_leads_url(@user), notice: "Account Created"
      else
        render :new
      end
    end
  
    def show
      @user = User.find_by(id: params[:id])
    end
  
    def update
      @user = User.find_by(id: params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  
    def edit
    end
  
    private
  
    helper_method :set_user
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(
          :username,
          :email,
          :password,
          :bio,
          :profile_picture,
          :created_on
          )
        end
  end