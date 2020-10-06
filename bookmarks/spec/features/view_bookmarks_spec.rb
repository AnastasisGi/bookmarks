feature 'viewing bookmarks' do
  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'viewing the bookmarks on bookmarks page' do
    begin
      con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
      con.exec("INSERT INTO bookmarks(url) VALUES ('www.google.com');")
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end

    visit '/bookmarks'
    expect(page).to have_content "www.google.com"
  end


end
