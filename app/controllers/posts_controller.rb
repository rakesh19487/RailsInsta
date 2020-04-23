class PostsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_post, only: [:show]

    def index
        @posts = Post.all.limit(10).includes(:photos)
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            if params[:images]
                params[:images].each do |img|
                    @post.photos.create(image: img)
                end    
            end    
            flash[:notice] = "Saved successfully ..."
            redirect_to posts_path
        else
            flash[:alert] = "Something went wrong ..."
            redirect_to posts_path
        end    
    end
    
    def show
        @photos = @post.photos
    end
    
    private
    def set_post
        @post = Post.find_by(id: params[:id])
        
        return if @post
        flash[:danger] = "Post does not exists"
        redirect_to root_path
    end    

    def post_params
        params.require(:post).permit(:content)
    end    
end    