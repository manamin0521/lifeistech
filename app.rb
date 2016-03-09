require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './image_uploader.rb'
require './models/item.rb'
require 'nokogiri'

enable :sessions

# get '/' do
#     erb :index
# end

get '/' do
    @artists = Artist.none
    @users = User.all
    # @artist = Artist.find(params[:id])
    # @artist_name = @artist.name
    # @users = @artist.users
    # redirect '/artist'
    if session[:user] #セッション中のユーザーがいれば、そのユーザーのartistsをいれる
        user = User.find(session[:user])
        @artists = user.artists
    end
    erb :index
end

get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

post '/signup' do
    @user = User.create(
        name: params[:name], 
        email: params[:email],
        password: params[:password], 
        password_confirmation: params[:password_confirmation],
        )
    
    if @user.persisted?
        session[:user] = @user.id
    end
    erb :index
end

post '/signin' do
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
    end
    redirect '/'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

get '/form' do
 erb :form
end

post '/create' do
       Artist.create({
        name: params[:name]
    })
 redirect '/artist'
end

get '/userpage/:id' do
    @users = User.all
    @user = User.find(params[:id])
    
    @user_artists = @user.artists
    erb :userpage
end

get '/artist/:id' do
    @artists = Artist.all
    @artist = Artist.find(params[:id])
    # @artist_name = @artist.name
    # @users = @artist.users
    erb :artist
end

post '/artist_create' do
    # Artist.create({
    artist = Artist.create({
        name: params[:name],
        body: params[:body],
        song1: params[:song1],
        song2: params[:song2],
        song3: params[:song3],
        song4: params[:song4],
        song5: params[:song5],
        songpr1: params[:songpr1],
        songpr2: params[:songpr2],
        songpr3: params[:songpr3],
        songpr4: params[:songpr4],
        songpr5: params[:songpr5],
        youtube1: params[:youtube1],
        youtube2: params[:youtube2],
        youtube3: params[:youtube3],
        youtube4: params[:youtube4],
        youtube5: params[:youtube5],
        album1: params[:album1],
        album2: params[:album2],
        album3: params[:album3],
        albumpr1: params[:albumpr1],
        albumpr2: params[:albumpr2],
        albumpr3: params[:albumpr3]
    })

    # user = User.find(session[:user]) #セッション中のuserを取得
    user = User.find(session[:user])
    user.artists << artist #セッション中のuserのartistsにartistを渡す

    if params[:file]
        image_upload(params[:file])
    end
 redirect '/'
end
    
post '/delete/:id' do
    Artist.find(params[:id]).destroy
   redirect '/'
end

post '/edit/:id' do
    @artist = Artist.find(params[:id])
    # redirect '/edit'
    erb :edit
end

post '/renew/:id' do
    @artist = Artist.find(params[:id])
    @artist.update({
        name: params[:name],
        body: params[:body],
        song1: params[:song1],
        song2: params[:song2],
        song3: params[:song3],
        song4: params[:song4],
        song5: params[:song5],
        songpr1: params[:songpr1],
        songpr2: params[:songpr2],
        songpr3: params[:songpr3],
        songpr4: params[:songpr4],
        songpr5: params[:songpr5],
        youtube1: params[:youtube1],
        youtube2: params[:youtube2],
        youtube3: params[:youtube3],
        youtube4: params[:youtube4],
        youtube5: params[:youtube5],
        album1: params[:album1],
        album2: params[:album2],
        album3: params[:album3],
        albumpr1: params[:albumpr1],
        albumpr2: params[:albumpr2],
        albumpr3: params[:albumpr3]
    })
    
    
    redirect '/'
end

