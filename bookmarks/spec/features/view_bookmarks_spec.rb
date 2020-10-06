feature 'viewing bookmarks' do
  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'viewing the bookmarks on bookmarks page' do
    visit '/bookmarks'
    expect(page).to have_content "www.google.com"
  end


end
