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
    !Bookmark.create(params[:Name], params[:Url]) ? (url_error; redirect('/add_bookmark')) : redirect('/')
  end

  get '/delete_bookmark' do
    erb(:delete_bookmark)
  end

  post '/deleted_bookmark' do
    !Bookmark.delete(params[:Name]) ? (title_error; redirect('/delete_bookmark')) : redirect('/')
    redirect('/')
  end

  get '/update_bookmark' do
    erb(:update_bookmark)
  end

  post '/updated_bookmark' do
    !Bookmark.update(params[:Name], params[:New_name]) ? (title_error; redirect('/update_bookmark')) : redirect('/')
    redirect('/')
  end

  run! if app_file == $0

  private

  def url_error
    flash[:url_error] = "Invalid url"
  end

  def title_error
  flash[:title_error] = 'No bookmarks with this name exist'
  end

end
