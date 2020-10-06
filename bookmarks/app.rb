require 'sinatra/base'
require './lib/bookmark'

ENV['bookmarkdb'] = 'bookmark_manager'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end
end
