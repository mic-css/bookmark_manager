ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/link'
require './lib/tag'
require './lib/user'
require './lib/dm_setup'

class BookmarkApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/' do
    erb :index
  end

  post '/users' do
    @email = params[:email]
    unless User.first(email: @email)
      user = User.create(username:     params[:username],
                          email:    @email,
                          password: params[:password],
                          password_confirmation: params[:password_confirmation])
      redirect to '/invalid_login' unless user.valid?
      session[:id] = user.id
      redirect to "/links"
    end
    redirect to '/invalid_login'
  end

  get '/invalid_login' do
    erb :invalid_login
  end

  get '/links' do
    erb :links
  end

  post '/new_link' do
    if params[:URL].include?('http://') || params[:URL].include?('https://')
      @url = params[:URL]
    else
      @url = 'http://' + params[:URL]
    end

    current_user.links.each {|link| @link = link if link.url == @url}

    @link ||= Link.create(title: params[:Title], url: @url)

    params[:Tags].downcase.split(', ').each do |tag|
      if Tag.all(name: tag).empty?
        @new_tag = Tag.create(name: tag)
        @link.tags << @new_tag
        @link.save
        @new_tag.links << @link
        @new_tag.save
      else
        @old_tag = Tag.first(name: tag)
        @link.tags << @old_tag
        @link.save
        @old_tag.links << @link
        @old_tag.save
      end
    end

    current_user.links << @link
    current_user.save

    redirect to "/links"
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
