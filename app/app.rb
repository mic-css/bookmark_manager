require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base
  # enable :sessions

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
