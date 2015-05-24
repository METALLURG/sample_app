class User < ActiveRecord::Base
  
# Перевод в нижний регистр email перед сохранением в базу
  before_save { self.email = email.downcase }

# Проверка превышения допустимой длинны имени пользователя
  validates :name,      presence:         true, 
                        length:         { maximum: 50 }

# Проверка правильности ввода почтового адреса "Имя.0-9@Домен.зона"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence:         true, 
                        format:         { with: VALID_EMAIL_REGEX },
                        uniqueness:     { case_sensitive: false }

# Метод безопасного создания и аутентификации новых пользователей
  has_secure_password

# Проверка превышения допустимой длинны пароля пользователя
  validates :password,  length:         { minimum: 6 }
end