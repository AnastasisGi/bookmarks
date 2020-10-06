require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      begin
        con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
        con.exec("INSERT INTO bookmarks(url) VALUES ('http://www.google.com'),('http://www.twitter.com');")
      rescue PG::Error => e
        puts e.message
      ensure
        con.close if con
      end

      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.twitter.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
