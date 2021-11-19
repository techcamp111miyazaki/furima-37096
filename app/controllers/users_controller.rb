class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      redirect_to action: 'show'
      lash.now[:alert] = '情報編集に失敗しました'
    end
  end

  private ##

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_reading, :first_name_reading,
                                 :birthday)
  end
end
