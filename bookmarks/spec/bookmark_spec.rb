require 'bookmark'

describe'.all' do
  it 'Returns a list of bookmarks ' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end
end

describe '.create' do
  it 'Can create a bookmark' do
    bookmark=Bookmark.create(url: 'http://www.rotten.com', title: 'Test Bookmark')
    expect(bookmark.url).to eq 'http://www.rotten.com'
    # p "bookmarkkk urlllll #{bookmark['url']}"
    expect(bookmark.title).to eq 'Test Bookmark'
  end

  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
  end
end

describe '.delete' do
  it 'deletes a specified bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all.length).to eq 0
  end
end



# describe Bookmark do
#   describe '.all' do
#     it 'returns all bookmarks' do
#       begin
#         con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
#         con.exec("INSERT INTO bookmarks(url) VALUES ('http://www.google.com'),('http://www.twitter.com');")
#         p con
#       rescue PG::Error => e
#         puts e.message
#       ensure
#         con.close if con
#       end
#
#       bookmarks = Bookmark.all
#       expect(bookmarks).to include("http://www.twitter.com")
#       expect(bookmarks).to include("http://www.google.com")
#     end
#   end
# end
