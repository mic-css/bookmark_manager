feature 'Adding multiple tags' do
  context 'when user adds a new link' do
    scenario 'user adds multiple tags' do
      visit '/'

      click_link 'Add link'
      fill_in 'title', with: 'Useless Web'
      fill_in 'url',   with: 'http://theuselessweb.com/'
      fill_in 'tags',  with: 'tag_1 tag_2'
      click_button 'Add link'

      link = Link.first
      expect(link.tags.map(&:name)).to include('tag_1', 'tag_2')
    end
  end
end
