feature 'Filtering bookmarks by tags' do

  before(:each) do
    Link.create(title: 'Useless Web', url: 'http://www.theuselessweb.com', tags: [Tag.first_or_create(name: 'example_tag')])
    Link.create(title: 'Makers Academy', url: 'http://www.MakersAcademy.com', tags: [Tag.first_or_create(name: 'education')])
    Link.create(title: 'Bubble Bobble', url: 'http://www.bubble-bobble.com', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(title: 'Bubble Visual Programming', url: 'http://www.bubble.is', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'a user can filter booksmarks by tags' do
    visit 'tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content 'Bubble Bobble'
      expect(page).to have_content 'Bubble Visual Programming'
      expect(page).not_to have_content 'Useless Web'
      expect(page).not_to have_content 'Makers Academy'
    end
  end

end
