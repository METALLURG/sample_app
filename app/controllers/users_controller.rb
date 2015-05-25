class UsersController < ApplicationController

  def show
    #Поиск пользователя по :id для дальнейшего отображения
    @user = User.find(params[:id])
  end

  def new
    # Определение переменной @user
    @user = User.new
  end

end
