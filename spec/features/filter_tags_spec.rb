require 'spec_helper'

feature 'filter links' do
  scenario 'filter by a tag' do
    visit '/links'
    fill_in "Title", with: 'Bubbles'
    fill_in "URL", with: 'bubbles.com'
    fill_in "Tags", with: 'Bubbles, fun'
    click_button 'Add new bookmark'
    visit '/tags/bubbles'
    expect(page).to have_content 'Title: Bubbles'
    expect(page).to have_content 'URL: http://bubbles.com'
    expect(page).to have_content 'Tags: bubbles, fun'
  end
end
