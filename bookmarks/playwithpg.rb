#!/usr/bin/ruby

require 'pg'

begin

  con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    con.exec( "SELECT * FROM bookmarks" ) do |result|
      # puts "     PID | User             | Query"
      result.each do |row|
      #   puts " %7d | %-16s | %s " %
      #     row.values_at('procpid', 'usename', 'current_query')

      puts row["url"]
      end
end



rescue PG::Error => e

    puts e.message

ensure

    con.close if con

end
