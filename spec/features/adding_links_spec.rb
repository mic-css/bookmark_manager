feature 'Adding links' do
  scenario 'user sees added link' do
    #sign in
    visit '/'

    click_link 'Add link'
    fill_in('title', with: 'Useless Web')
    fill_in('url', with: 'http://theuselessweb.com/')
    click_button 'Submit'

    expect(page).to have_content('Useless Web')
  end
end
