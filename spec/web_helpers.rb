def create_link(url, title, tags)
  visit '/links/new'
  fill_in 'url', with: url
  fill_in 'title', with: title
  fill_in 'tags', with: tags
  click_button('Add')
end

def sign_up(email: 'evil_kitty@dogslife.com',
            password: 'humanslavesrgr8',
            password_confirmation: 'humanslavesrgr8')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up!'
end

def sign_in(email, password)
  visit '/sessions/new'

  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in'
end
