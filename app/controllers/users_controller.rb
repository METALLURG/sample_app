class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    #Поиск пользователя по :id для дальнейшего отображения
    @user = User.find(params[:id])
  end

  def new
    # Определение переменной @user
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # Вход пользователя сразу после регистрации
    if @user.save

      # Сказать UserMailer отослать приветственное письмо после сохранения
      UserMailer.registration_confirmation(@user).deliver

      sign_in @user
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      render 'new'
#        format.html { render action: 'new' }
#        format.json { render json: @user.errors, status: :unprocessable_entity }

    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Ваш профиль обновлён"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён."
    redirect_to users_url
  end
################################################################################
  private

    def user_params
      params.require(:user).permit( :surname,
                                    :name,
                                    :patronymic,
                                    :country,
                                    :region,
                                    :city,
                                    :mobtel,
                                    :skype,
                                    :vk,
                                    :email, 
                                    :password,
                                    :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста войдите в систему."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
