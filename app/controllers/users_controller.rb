class UsersController < ApplicationController

  def show
    #Поиск пользователя по :id для дальнейшего отображения
    @user = User.find(params[:id])
  end

  def new
    # Определение переменной @user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # Вход пользователя сразу после регистрации
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
################################################################################
  private

    def user_params
      params.require(:user).permit( :name, 
                                    :email, 
                                    :password,
                                    :password_confirmation)
    end

end
