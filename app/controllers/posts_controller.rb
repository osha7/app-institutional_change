
class PostsController < ApplicationController

    #index
    get '/posts' do
        #eventually put all the posts here
        @post = Post.all
        erb :'/posts/index'
    end


end
