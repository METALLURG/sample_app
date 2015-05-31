require 'spec_helper'

describe "User pages" do

  subject { page }

# Тесты для страницы со списком пользователей
  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit users_path
    end

    it { should have_title('All users') }
    it { should have_content('Таблица всех пользователей') }

    # Тесты для пагинации
    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all)  { User.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end

    # Тесты для удаляющих ссылок
    describe "delete links" do

      it { should_not have_link('Удалить') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('Удалить', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('Удалить', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('Удалить', href: user_path(admin)) }
      end
    end

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end # describe "index"

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

# Проверка ошибки регистрации пользователя с пустыми формами
    describe "with invalid information" do
      # Счётчик пользователей не изменяется при ошибочной регистрации
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      # Проверка вывода текстового списка ошибок при ошибочной регистрации
      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

# Проверка регистрации пользователя с заполненными формами
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      # Проверка alert приветствия при удачной регистрации пользователя
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

      # Счётчик пользователей увеличивается на 1 пункт при регистрации
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

# Тесты для страницы редактирования пользователя
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end