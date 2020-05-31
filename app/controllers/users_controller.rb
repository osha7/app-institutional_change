
class UsersController < ApplicationController

    get '/signup' do
       
        erb :"users/signup.html"
    end

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.last_initial = params[:last_initial]
        @user.phone_number = params[:phone_number]
        @user.zip = params[:zip]
        @user.ethnicity = params[:ethnicity]
        @user.political_party = params[:political_party]
        
        if @user.save
            redirect to '/login'
        else
            erb :"users/signup.html"
        end
    end

end