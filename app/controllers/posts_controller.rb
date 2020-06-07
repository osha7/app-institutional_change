
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
        if !logged_in?
            redirect to '/login'
        else
            erb :'/posts/new'
        end
    end

    # create (create)
    post '/posts' do
        # post = Post.create(name: params[:name], content: params[:content])
        @post = Post.create(  #see posts/new.erb for nested params
        user_id: session[:user_id],
        name: params[:name],
        content: params[:content]
        )
        #binding.pry
     
        redirect to "/posts/#{@post.id}"
    end

    # show (read)
    get '/posts/:id' do  #:id ==> is the 'slug/wildcard'
        id = params[:id]
        @post = Post.find_by(id: id)

        erb :'/posts/show'
    end

    # edit (read)
    get '/posts/:id/edit' do
        id = params[:id]
        @post = Post.find_by(id: id)  #ln 37/38 condense see below - either acceptable

        erb :'/posts/edit'
    end

    # update (update)
    # put changes all overwrites entire body/ patch only make the specified change requested
    # must use middleware (Rack::MethodOverride) to send put/patch/delete requests - HTML only recognizes get and post
    put '/posts/:id' do
        post = Post.find_by(id: params[:id])
        post.update(params[:post])

        redirect to "posts/#{post.id}"
    end

    # destroy (destroy)
    delete '/posts/:id' do
        post = Post.find_by(id: params[:id])
        post.destroy

        redirect to "/posts"
    end

end
