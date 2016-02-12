require 'spec_helper'

feature 'User sign in' do
  let(:user) do
    User.create(email: 'hello@mymail.com',
                password: '123example',
                password_confirmation: '123example')
  end

  scenario 'with correct credentials' do
    sign_in(user.email, user.password)

    expect(current_path).to eq('/links')
    expect(page).to have_content("Welcome, #{user.email}")
  end

  scenario 'with incorrect credentials' do
    sign_in(user.email, 'incorrect123')

    expect(current_path).to eq('/sessions')
    expect(page).not_to have_content("Welcome, #{user.email}")
    expect(page).to have_content('The email or password is incorrect')
  end
end
