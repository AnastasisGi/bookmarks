feature 'Adding a new bookmark ' do
  scenario ' A user can add a bookmark to Bookmark manager  ' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content'http://testbookmark.com'
  end
end

feature 'Adding a new bookmark' do
  it 'Can add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with:'http://testbookmark.com')
    fill_in('title',with:'Test bookmark')
    click_button('Submit')
    p "paaagggeee #{page}"
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
