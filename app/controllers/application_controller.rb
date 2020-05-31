require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
        set :session_secret, "we_change"
  end

  get "/" do
    erb :welcome
  end
  

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      # ^^ instance variable [if it has a value, then leave it]
      # or [||]
      # or go find user by id in session
    end

    def login (email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect '/login'
      end
    end
    
  end


end
