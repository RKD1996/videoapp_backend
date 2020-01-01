class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render :json => {
        :msg => "User Created"
      },
      :status => 200
    else
      render :json => {
        :msg => "User Not Created"
      }
    end
  end

  def login
    user = User.find_by_username(params[:username])
    if user.present?
      password = JWT.decode user.password_digest, user.password_salt, false, { algorithm: 'HS256' }
      if password[0] == params[:password_digest]
        render :json => {
            :name => user.name,
            :user_id => user.username,
            :token => BCrypt::Engine.generate_salt
        },
        :status => 200
      else
        render :json => {
          :msg => "Password Or Username Is Incorect"
        }
      end
    else
      render :json => {
        :msg => "User Dosen't Exist"
      }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password_digest, :username)
  end
end
