def truncate_test_db
  begin
    con = PG.connect :dbname => ENV['bookmarkdb'] , :user => 'student'
    con.exec("TRUNCATE TABLE bookmarks")
  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
end
