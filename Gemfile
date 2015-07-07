source 'https://rubygems.org'
ruby '2.0.0-p643'
#ruby-gemset=railstutorial_rails_4_0
#
gem 'rails', '4.0.2'
gem 'slim'
gem 'bootstrap-sass', '2.3.2.0'
gem 'bcrypt-ruby', '3.1.2'
gem 'faker', '1.1.2'                    # Фейковые пользователи
gem 'russian'
gem 'cancancan'
gem 'mail'
gem 'workflow'
gem 'tinymce-rails'

# Admin panel
gem 'first_admin_panel', github: 'ImmaculatePine/first_admin_panel'
gem 'simple_form'
gem 'nested_form'
gem 'kaminari'
gem 'bootstrap-kaminari-views'

group :development, :test do
  gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'

  # Гем, который добавляет специфические для Rails таски, такие как прогон миграций и компиляция ассетов
  gem 'capistrano-rails'
  # Гем, добавляющий возможности bundle к capistrano
  gem 'capistrano-bundler'
  # Добавление поддержки Rbenv (менеджера версий для Ruby)
  gem 'capistrano-rbenv'
  # Интеграция пумы и капистрано
  gem 'capistrano3-puma'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
end

#gem 'sass-rails', '4.0.1'
gem 'sass-rails', '5.0.2'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'

  # Puma - это Ruby/Rack сервер, который будет получать запросы из Nginx и направлять их в Rails, эдакое связующее звено
  gem 'puma'
end
