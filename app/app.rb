ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def signed_in?
      !@current_user.nil?
    end
  end

  get '/' do
    if signed_in? # not working currently
      redirect '/links'
    else
      redirect '/sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/sessions/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    array = (params[:tags]).split(' ')
    array.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  # FIXME: needs to be a GET request
  post '/links/:tag_name' do
    tag = Tag.first(name: params[:search_tag])
    @links = tag ? tag.links : []
    # redirect '/links'
    erb :'links/index'
   end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  run! if app_file == $0
end
