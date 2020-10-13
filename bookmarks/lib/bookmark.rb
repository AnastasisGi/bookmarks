require 'pg'

class Bookmark
  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result=connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| bookmark['url']}


    if ENV['ENVIRONMENT']='test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection=PG.connect(dbname:'bookmark_manager')
    end

      result=connection.exec("SELECT * FROM bookmarks;")
      result.map{|bookmark| bookmark['url']}
  end

  def self.create(url:, title:)

    if ENV['ENVIRONMENT']='test'
      connection=PG.connect(dbname: 'bookmark_manager_test')
    else
      connection=PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks(url,title) VALUES ('#{url}', '#{title}') RETURNING id, url, title")
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
