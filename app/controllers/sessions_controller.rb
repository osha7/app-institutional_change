
class SessionsController < ApplicationController

    get '/login' do

        erb :"sessions/login.html"

    end

    post '/sessions' do
        login(params[:email], params[:password])
        redirect to '/'
    end

    get '/logout' do
        logout!
        redirect to '/'
    end

end
