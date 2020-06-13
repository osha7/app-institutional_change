require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'we_change'
  end

  get "/" do
    @user = current_user

    erb :welcome
  end
  
  get '/commitment-in-community' do
    @users = User.all 

    erb :'/commitment_in_community'
  end

  get '/resources' do

    erb :'/resources'
  end

  get '/editors-quarterly' do

    erb :'/editors_quarterly'
  end

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      # ^^ instance variable [if it has a value, then leave it]
      # or [||]
      # or go find user by id in session
    end

    def logged_in?
      # !!session[:user_id]
      !!current_user   #micah's video
    end

    def authenticate #micah's video
      redirect '/login' if !logged_in?
    end

    def authorize(post) #micah's video
      redirect '/login' if post.user != current_user 
    end
    
  end


end
