module Api 
  class UsersController < ApplicationController
    before_action :set_park, only: [:show, :edit, :update, :destroy]
    def show
      user = User.findAll()
      render :json=> user
    end

    def create
      user = User.new(user_params)
  
      respond_to do |format|
        if user.save
          format.html { redirect_to user, notice: 'Park was successfully created.' }
          format.json { render :show, status: :created, location: user }
        else
          format.html { render :new }
          format.json { render json: user.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :email,:password)
      end
  end
end 