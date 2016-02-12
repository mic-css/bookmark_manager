require 'spec_helper'

feature 'User sign out' do
  let(:user) do
    User.create(email: 'hello@mymail.com',
                password: '123example',
                password_confirmation: '123example')
  end

  scenario 'logged in user can sign out' do
    sign_in(user.email, user.password)

    visit '/links'
    click_button 'Sign out'
    expect(page).to_not have_content 'Welcome, hello@mymail.com'
  end
end
