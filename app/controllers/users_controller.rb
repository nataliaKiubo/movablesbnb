class UsersController < ApplicationController
  # GET /users/1/edit
  def edit
  end

  # PUT /users/1
  def update
  end

  # GET /users/1
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :gallery_image)
  end
end
