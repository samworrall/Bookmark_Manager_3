require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'
require 'sinatra'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/added_bookmark' do
    !Bookmark.create(params[:Url]) ? (error; redirect('/')) : redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  run! if app_file == $0

  private

  def error
    flash[:notice] = "INVALID URL"
  end

end
