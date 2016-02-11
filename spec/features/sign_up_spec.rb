feature 'Sign up' do
  scenario 'new user signs up from homepage' do
    visit '/'

    fill_in 'Username',  with: 'User'
    fill_in 'Email',      with: 'example@nomail.com'
    fill_in 'Password',   with: 'example123'
    click_button 'Sign up!'

    expect(page).to have_content 'Welcome, User!'
    expect{ User.count }.to change_by 1
    expect(User.first.email).to eq 'example@nomail.com'
  end

  scenario 'user signs up with existing email' do
    User.create(username: 'User',
                email: 'example@nomail.com',
                password: 'example123')
    visit '/'

    fill_in 'Username',  with: 'User'
    fill_in 'Email',      with: 'example@nomail.com'
    fill_in 'Password',   with: 'example123'
    click_button 'Sign up!'

    expect(page).to have_content 'Invalid login: this email already exists'
    expect(page).to have_button 'Back to login page'
  end
end
