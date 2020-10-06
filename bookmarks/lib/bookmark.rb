require 'pg'


class Bookmark
  def self.all
    begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
      bookmarks=con.exec( "SELECT * FROM bookmarks" ) do |result|
        result.map { |row| row["url"]}
      end
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
    bookmarks
  end
end
