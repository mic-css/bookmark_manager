require 'spec_helper'

feature 'Filtering and viewing tags' do

  scenario 'filtering links with certain tags' do
    create_link('www.facebook.com', 'Facebook', 'bubbles')
    create_link('www.somewhere.com', 'Somewhere Other Than Here', 'bubbles')
    create_link('www.somewhere_old.com', 'Somewhere in the past', 'history')
    create_link('www.wordpress.com', 'Wordpress', 'blog')

    visit '/links'
    fill_in 'search_tag', with: 'bubbles'
    click_button("Search By Tag")

    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Facebook')
      expect(page).to have_content('Somewhere Other Than Here')
      expect(page).not_to have_content('Somewhere in the past')
      expect(page).not_to have_content('Wordpress')
    end
  end
end
