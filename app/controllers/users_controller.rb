
class UsersController < ApplicationController

    get '/signup' do
       
        erb :"/users/signup"
    end

    # this is post '/signup'
    post '/users' do          
      @user = User.create(params)
        # if params[:email] == "" || params[:password] == "" || params[:first_name] == "" || params[:last_initial] == "" || params[:zip_code] == ""
        # but bc we validate it in User model:  we use:
        if !@user.save
            erb :'/users/signup' # has to be an erb & not a redirect.  If redirect, you lose err messages
                                ### err messages in view file from Micah's Video
        else 
            @user.save
            session[:user_id] = @user.id
            redirect to '/login'
        end
    end

    get '/failure' do
        erb :"/users/failure"
    end


    get '/login' do
        erb :"/users/login"
    end  

    # this is post '/login'
    post '/sessions' do
        @user = User.find_by(email: params[:email])
    # binding.pry
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
        # binding.pry
            redirect to "/users/dashboard"
        else
            @err = "Invalid Credentials"   ###error msg - from Micah's Video
            erb :"/users/login"             #has to be an erb & not a redirect.  If redirect, you lose err messages
        end
    end

    get '/logout' do
        session.destroy
        redirect to '/'
    end

    get '/users/dashboard' do
        @user = current_user
        # binding.pry
        if !logged_in?
        redirect to '/login'
        else
        erb :'/users/dashboard' 
        end
    end

    

end
