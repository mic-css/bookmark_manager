require 'spec_helper'

feature 'Signing up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, evil_kitty@dogslife.com')
    expect(User.first.email).to eq("evil_kitty@dogslife.com")
  end

  scenario 'I cannot sign up when my password does not match' do
    expect { sign_up(password_confirmation: 'wrong') }
    .not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
    expect(page).not_to have_content('Welcome, evil_kitty@dogslife.com')
  end

  scenario 'I cannot sign up when my email is not entered' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
