class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  # Structure made by lewagon - Geocode lecture
  def index
    @users = User.all
    # The `geocoded` scope filters only flats/user with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: current_user })
      }
    end
  end
  # end of index test structure

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # GET /users/1
  def show
    authorize @user
  end

# PUT /users/1
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Your profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
    params.require(:user).permit(:email, :password, :first_name, :last_name, :photo, :address)
  end
end
