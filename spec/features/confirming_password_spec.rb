require 'spec_helper'

feature 'Confirming password' do
  scenario 'user cannot sign up unless password confirmation matches' do
    visit '/'
    fill_in 'Username',         with: 'User'
    fill_in 'Email',            with: 'example@nomail.com'
    fill_in 'Password',         with: 'example123'
    fill_in 'Confirm password', with: '321elpmaxe'


    expect { click_button 'Sign up!' }.not_to change { User.count }
  end
end
