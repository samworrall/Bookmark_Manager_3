require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'
require 'sinatra'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:add_bookmark)
  end

  post '/added_bookmark' do
    if params[:Url] =~ URI::regexp
      Bookmark.create(params[:Url])
    else
      flash[:notice] = "INVALID URL"
    end
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:view_bookmark)
  end

  run! if app_file == $0

end
