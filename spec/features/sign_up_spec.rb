feature 'Sign up' do
  scenario 'new user signs up from homepage' do

    sign_up_new_user

    expect(page).to have_content 'Welcome, User!'
    expect(User.count).to eq 1
    expect(User.first.email).to eq 'example@nomail.com'
  end

  scenario 'user signs up with existing email' do
    User.create(username: 'User',
                email: 'example@nomail.com',
                password: 'example123')
    sign_up_new_user
    expect(page).to have_content 'Invalid login: this email already exists'
    expect(page).to have_button 'Back to login page'
  end
end
