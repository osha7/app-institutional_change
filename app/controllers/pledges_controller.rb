
class PledgesController < ApplicationController

    get '/pledges/1' do
        @user = User.find_by_id(session[:id])
        erb :'/pledges/pledge_1'
    end

    post '/pledges/1' do
 #binding.pry
     # @user = current_user
        @pledge = Pledge.create(params)
        @pledge.user_id = current_user.id
        @pledge.save
        redirect to :'/pledges/1'
    end

    get '/pledges/2' do
        @user = User.find_by_id(session[:id])
        erb :'/pledges/pledge_2'
    end

    post '/pledges/2' do
    #binding.pry
        @pledge = Pledge.create(params)
        @pledge.user_id = current_user.id
        @pledge.save
        redirect to :'/pledges/2'
    end

    get '/pledges/3' do
        @user = User.find_by_id(session[:id])
        erb :'/pledges/pledge_3'
    end

    post '/pledges/3' do
        @pledge = Pledge.create(params)
        @pledge.user_id = current_user.id
        @pledge.save
        redirect to :'/pledges/3'
    end

    get '/pledges/4' do
        @user = User.find_by_id(session[:id])
        erb :'/pledges/pledge_4'
    end

    post '/pledges/4' do
#binding.pry
        @pledge = Pledge.create(params)
        @pledge.user_id = current_user.id
        @pledge.save
        redirect to :'/pledges/4'
    end
    
end
