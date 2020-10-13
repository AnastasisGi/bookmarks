feature 'viewing bookmarks' do
  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end

feature 'Viewing bookmarks ' do
  scenario 'A user  can see bookmarks ' do
  Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
  Bookmark.create(url: 'http://www.destroyallsoftware.com',title: 'Destroy All Software')
  Bookmark.create(url: 'http://www.google.com', title: 'Google')


    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES (2, 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks VALUES (3, 'http://www.google.com');")
    visit ('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end

end



  # scenario 'viewing the bookmarks on bookmarks page' do
#     begin
#       con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
#       con.exec("INSERT INTO bookmarks(url) VALUES ('www.google.com');")
#     rescue PG::Error => e
#       puts e.message
#     ensure
#       con.close if con
#     end
#
#     visit '/bookmarks'
#     expect(page).to have_content "www.google.com"
  # end
#
#
end
