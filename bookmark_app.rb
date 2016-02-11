ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/link'
require './lib/tag'
require './lib/user'
require './lib/dm_setup'

class BookmarkApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/users' do
    # set user information here
    @email = params[:email]
    unless User.first(email: @email)
      user = User.create(username: params[:username],
                          email:    @email,
                          password: params[:password])
      redirect to "/#{user.id}/links"
    end
    redirect to '/invalid_login'
  end

  get '/invalid_login' do
    erb :invalid_login
  end

  get '/:id/links' do
    @user = User.first(id: params[:id])
    erb :links
  end

  post '/:id/links' do
    user = User.first(id: params[:id])

    if params[:URL].include?('http://') || params[:URL].include?('https://')
      @url = params[:URL]
    else
      @url = 'http://' + params[:URL]
    end

    if Link.all(url: @url).empty?
      @link = Link.create(title: params[:Title], url: @url)
      user.links << @link
      user.save
    else
      @link = Link.first(url: @url)
    end

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

    redirect to "/#{params[:id]}/links"
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
