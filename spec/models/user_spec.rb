require 'spec_helper'

describe User do
# Выполнения блока "before do" перед каждым тестом
  before do
    @user = User.new( name:                   "Example User", 
                      email:                  "user@example.com",
                      password:               "password_example",
                      password_confirmation:  "password_example"
                    )
  end

  subject { @user }

# Объект User должен отвечать на (:__________) },
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
###############################################################################
# Проверка отсутствия пустого поля имени пользователя
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

# Проверка превышения допустимой длины имени пользователя
    describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
###############################################################################
# Проверка отсутствия пустого поля почтового адреса
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
# Проверка НЕ правильности ввода почтового адреса "Имя.0-9@Домен.зона"
    describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

# Проверка правильности ввода почтового адреса "Имя.0-9@Домен.зона"
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

# Проверка повторной регистрации под одним почтовым адресом
describe "when email address is already taken" do
    before do
      # Создание дубликата почтового адреса для тестирования
      user_with_same_email = @user.dup
      # Выравнивание регистра почтового адреса
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
###############################################################################
# Проверка наличия пароля
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

# Проверка не совпадения пароля при проверке
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch_password_example" }
    it { should_not be_valid }
  end

# Проверка минимальной допустимой длины пароля
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

# Возвращаемое значение проверки наличия пользователя в БД
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

# Проверка подлинности пароля пользователя
    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

# Проверка провала подлинности пароля пользователя
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
###############################################################################
end