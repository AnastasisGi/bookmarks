feature 'deleting bookmarks' do
  scenario 'delete a bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    Bookmark.create(url: 'http://www.testbookmark2.com', title: 'Test Bookmark2')
    visit '/bookmarks'
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
    expect(page).to have_link('Test Bookmark2', href: 'http://www.testbookmark2.com')
  end
end
