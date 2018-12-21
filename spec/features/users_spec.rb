require 'rails_helper'

feature 'Userの作成' do
  before do
    visit new_user_registration_path
  end

  context 'データが正しい場合' do
    scenario 'userが作成されること' do
      fill_in 'user_name', with: 'aaa'
      fill_in 'user_tel', with: '08000000000'
      fill_in 'user_email', with: "example@example.com"
      fill_in 'user_password', with: '11111111'
      fill_in 'user_password_confirmation', with: '11111111'
      expect {
        click_button 'Sign up'
      }.to change(User, :count).by(1)


      user = User.last
      expect(current_path).to eq root_path
      expect(user.name).to eq "aaa"
    end
  end
  context 'データが正しくない場合' do
    scenario 'articleが作成できないこと' do
      fill_in 'user_name', with: 'aaa'
      fill_in 'user_tel', with: '080' #正しくない値
      fill_in 'user_email', with: "example@example.com"
      fill_in 'user_password', with: '11111111'
      fill_in 'user_password_confirmation', with: '11111111'
      click_button 'Sign up'

      expect(page).to have_content 'Sign up Please review the problems below:'
    end
  end
end