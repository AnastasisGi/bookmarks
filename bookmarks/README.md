
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks


CLIENT: path ‘/bookmarks’  -> method GET -> CONTROLLER: app.rb  -> .all -> MODEL: class Bookmark -> array [bookmarks] -> CONTROLLER -> array [bookmarks] -> VIEWS: erb bookmarks -> html -> CONTROLLER -> response -> CLIENT: renders html

SQL
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql




 Decompose the requirement 'add new bookmarks' into a User Story.
 It will GET with form input a new bookmark
 It will post it and with the PG will input the bookmark into the database
 user can print on the screen the bookmark list.


 GIVEN: a user goes to '/'
 WHEN: they fill in the input field with text (a url)
 WHEN: they click submit
 THEN: they see all the bookmarks (with their new one) on the page.
