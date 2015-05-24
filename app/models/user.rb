class User < ActiveRecord::Base
  
  # Перевод в нижний регистр email перед сохранением в базу
  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format:         { with: VALID_EMAIL_REGEX },
                    uniqueness:     { case_sensitive: false }
end