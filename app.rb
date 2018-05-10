require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'
require 'sinatra'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/add_bookmark' do
    erb(:add_bookmark)
  end

  post '/added_bookmark' do
    !Bookmark.create(params[:Name], params[:Url]) ? (error; redirect('add_bookmark')) : redirect('/')
  end

  run! if app_file == $0

  private

  def error
    flash[:notice] = "INVALID URL"
  end

end
