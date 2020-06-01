
class UsersController < ApplicationController

    get '/signup' do
       
        erb :"users/signup"
    end

    # signup post
    post '/users' do
        @user = User.create(params)
        if @user
            session[:user_id] = @user.id
            redirect to '/login'
        else
            erb :"/users/signup"
        end
    end

    get '/login' do
        erb :"/users/login"
    end  

    # login post
    post '/sessions' do
        @user = User.find_by(email: params[:email])
    # binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    # binding.pry
      redirect to "/users/home"
    else
      redirect to "/users/login"
    end
    end

    get '/logout' do
        session.destroy
        redirect to '/'
    end

    get '/users/home' do
        @user = current_user
        # binding.pry
        if !logged_in?
        redirect to 'users/login'
        else
        erb :'/users/home' 
        end
    end

end
