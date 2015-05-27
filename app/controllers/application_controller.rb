class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Включение модуля SessionsHelper в контроллер Application
  include SessionsHelper

end