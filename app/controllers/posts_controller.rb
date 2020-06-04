
class PostsController < ApplicationController

    # index (read)
    get '/posts' do
        #put all the posts here
        @posts = Post.all
        erb :'/posts/index'
    end

    # new (read)
    # more specific so needs to be listed above show
    get '/posts/new' do

        erb :'/posts/new'
    end

    # create (create)
    post '/posts' do
        # post = Post.create(name: params[:name], content: params[:content])
        post = Post.create(params[:post])  #see posts/new.erb for nested params
        redirect to "/posts/#{post.id}"
    end

    # show (read)
    get '/posts/:id' do  #:id ==> is the 'slug/wildcard'
        id = params[:id]
        @post = Post.find_by(id: id)

        erb :'/posts/show'
    end

    # update (read)
    get '/posts/:id/edit' do
        id = params[:id]
        @post = Post.find_by(id: id)
        erb :'/posts/edit'
    end

end
