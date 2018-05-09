require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:add_bookmark)
  end

  post '/added_bookmark' do
    Bookmark.create(params[:Url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmark)
  end

  run! if app_file == $0

end
