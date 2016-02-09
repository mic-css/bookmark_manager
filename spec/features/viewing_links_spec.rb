feature 'Viewing links' do
  context 'if user is signed in' do
    scenario 'user sees list of links on homepage' do
      Link.create(url: 'http://google.com', title: 'Google')
      visit '/links'

      within 'ul#links' do
        expect(page).to have_content 'Google'
      end
    end
  end
end
