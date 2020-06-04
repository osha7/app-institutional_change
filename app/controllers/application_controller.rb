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
  
  get '/commitment_in_community' do
    @users = User.all 

    erb :'/commitment_in_community'
  end

  get '/resources' do

    erb :'/resources'
  end

  get '/editors_quarterly' do

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
      !!session[:user_id]
    end
    
  end


end
