class UserMailer < ActionMailer::Base
  default :from => "ryan@railscasts.com"
  
  def registration_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/public/rails.png")
    attachments["zaklin.docx"] = File.read("#{Rails.root}/public/zaklin.docx")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "ИСКУМ - МЦВОПИМ
 - Успешная регистрация")
  end
end