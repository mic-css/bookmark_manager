def add_link
  fill_in "Title", with: 'DataMapper'
  fill_in "URL", with: 'http://datamapper.org/'
  fill_in "Tags", with: 'data'
  click_button 'Add new bookmark'
end

def sign_up_new_user
  visit '/'
  fill_in 'Username',  with: 'User'
  fill_in 'Email',      with: 'example@nomail.com'
  fill_in 'Password',   with: 'example123'
  click_button 'Sign up!'
end
