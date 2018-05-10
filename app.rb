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

  get '/delete_bookmark' do
    erb(:delete_bookmark)
  end

  post '/deleted_bookmark' do
    Bookmark.delete(params[:Name])
    redirect('/')
  end

  get '/update_bookmark' do
    erb(:update_bookmark)
  end

  post '/updated_bookmark' do
    Bookmark.update(params[:Name], params[:New_name])
    redirect('/')
  end

  run! if app_file == $0

  private

  def error
    flash[:notice] = "INVALID URL"
  end

end
