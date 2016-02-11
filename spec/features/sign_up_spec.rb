feature 'Sign up' do
  scenario 'new user signs up from homepage' do
    visit '/'

    fill_in 'Username:',  with: 'User'
    fill_in 'Email',      with: 'example@nomail.com'
    fill_in 'Password',   with: 'example123'
    click_button 'Sign up!'

    expect(page).to have_content 'Welcome, User!'
    expect{ User.count }.to change_by 1
    expect(User.first.email).to eq 'example@nomail.com'
  end
end
