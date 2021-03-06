require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb:'bookmarks/new'
  end

  post '/bookmarks'do
    # p params
    # url=params['url']
    Bookmark.create(url: params[:url], title: params[:title])
    #
    # connection=PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks(url) VALUES ('#{url}');")
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end
end
