
class PostsController < ApplicationController

    
    get '/posts' do
       
        @posts = Post.all

        erb :'/posts/index'
    end

    get '/posts/your-posts' do
        authenticate
       
        erb :'/posts/users_posts'
    end

   
    # more specific so needs to be listed above show
    get '/posts/new' do
        authenticate

        erb :'/posts/new'
    end

  
    post '/posts' do
        authenticate
        # post = Post.create(name: params[:name], content: params[:content])
        @post = Post.create(  #see posts/new.erb for nested params
        user_id: session[:user_id],
        name: params[:name],
        content: params[:content]
        )
        #binding.pry
     
        redirect to "/posts/#{@post.id}"
    end

##########################################################################################
    get '/posts/search'  do
        #binding.pry
        @posts = Post.where("name LIKE '%#{params[:search]}%'")
        erb :'/posts/search_results'
    end
    
#     get '/posts/search_results' do
# binding.pry
##### With the redirect of a post route, we would lose the params.  The route above, the get method, we have full access to the params still
#     end
##########################################################################################
   
    get '/posts/:id' do  
        # if !logged_in?
        #     redirect to '/login'
        # else
        authenticate
        id = params[:id]
        @post = Post.find_by(id: id)
        
        #authorize(@post) - can't use this, bc i want all users to have ability to see all posts

        erb :'/posts/show'
        #end
    end

 
    get '/posts/:id/edit' do

        id = params[:id]
        @post = Post.find_by(id: id)  
      
        # if @post.user_id == current_user.id
        authorize(@post)

        erb :'/posts/edit'

        # else
        #     redirect to '/posts'
        # end

    end

    
    put '/posts/:id' do   #can be either put or patch
        post = Post.find_by(id: params[:id])
        #binding.pry
        authorize(post)
        # if post.user_id == current_user.id
            post.update(params[:post])       #ex: if patch: @post.update(content: params[:content])

            redirect to "posts/#{post.id}"  

        # else
        #     redirect to '/posts'

        # end

    end


    delete '/posts/:id' do
        post = Post.find_by(id: params[:id])
        authorize(post)
       # if post.user_id == current_user.id
            post.destroy

            redirect to "/posts/your-posts"

        # else
        #     redirect to '/posts'
        # end
    end

end
