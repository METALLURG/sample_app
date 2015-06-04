class User < ActiveRecord::Base
  
  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations

# Перевод в нижний регистр email перед сохранением в базу
  before_save { self.email = email.downcase }
# Обратный вызов before_create для создания remember_token
  before_create :create_remember_token

# Проверка превышения допустимой длинны имени пользователя
  validates :name,      presence:         true, 
                        length:         { maximum: 50 }

# Проверка правильности ввода почтового адреса "Имя.0-9@Домен.зона"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,     presence:         true, 
                        format:         { with: VALID_EMAIL_REGEX },
                        uniqueness:     { case_sensitive: false }

# Метод безопасного создания и аутентификации новых пользователей
  has_secure_password

# Проверка превышения допустимой длинны пароля пользователя
  validates :password,  length:         { minimum: 6 }

# Обратный вызов before_create для создания remember_token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # @return [String] полное имя пользователя
  def full_name
    [name, surname].select(&:present?).join(' ')
  end

  # Сообщает, зарегистрирован ли пользователь на событие
  # @param event [Event] событие
  # @return [Boolean] true, если подписан. false, если нет
  def registered_to?(event)
    event_ids.map(&:to_s).include?(event.id.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end