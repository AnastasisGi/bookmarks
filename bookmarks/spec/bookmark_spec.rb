require 'bookmark'

describe'.all' do
  it 'Returns a list of bookmarks ' do
      connection=PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      bookmarks=Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
  end
end

describe '.create' do
  it 'Can create a bookmark' do
    bookmark=Bookmark.create(url: 'http://www.rotten.com', title: 'Test Bookmark').first
    expect(bookmark['url']).to eq 'http://www.rotten.com'
    # p "bookmarkkk urlllll #{bookmark['url']}"
    expect(bookmark['title']).to eq 'Test Bookmark'
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
