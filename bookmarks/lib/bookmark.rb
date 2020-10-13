require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname:'bookmark_manager')
    end

    result=connection.exec("SELECT * FROM bookmarks;")
    result.map{ |bookmark| new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id']) }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection=PG.connect(dbname: 'bookmark_manager_test')
    else
      connection=PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id=#{id};")
  end
end

# [
#       "http://www.makersacademy.com",
#       "http://www.destroyallsoftware.com",
#       "http://"
#      ]

#   begin
#     con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
#     bookmarks=con.exec("SELECT * FROM bookmarks") do |result|
#       result.map { |row| row["url"] }
#
#     end
#   rescue PG::Error => e
#     puts e.message
#   ensure
#     con.close if con
#   end
#
