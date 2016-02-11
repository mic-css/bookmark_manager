require 'spec_helper'

feature 'create links' do

  scenario 'save a new link to the homepage' do
    visit '/'
    sign_up_new_user
    expect(page).to have_button 'Add new bookmark'
    add_link
    within 'ul#links' do
      expect(page).to have_content 'Title: DataMapper'
      expect(page).to have_content 'URL: http://datamapper.org/'
      expect(page).to have_content 'Tags: data'
    end
  end

end
