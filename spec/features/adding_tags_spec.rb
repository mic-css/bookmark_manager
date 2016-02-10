feature 'Adding tags' do
  context 'when adding a new link' do
    scenario 'a user can add tags' do
      visit '/'
      # sign_in

      click_link 'Add link'
      fill_in 'title', with: 'Useless Web'
      fill_in 'url',   with: 'http://theuselessweb.com/'
      fill_in 'tags',  with: 'example_tag'
      click_button 'Add link'

      link = Link.first
      expect(link.tags.map(&:name)).to include('example_tag')
    end
  end
end
