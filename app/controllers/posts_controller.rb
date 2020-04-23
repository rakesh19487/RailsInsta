class PostsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_post, only: [:show, :destroy]

    def index
        @posts = Post.all.limit(10).includes(:photos, :user).order("created_at DESC")
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            if params[:images]
                params[:images].each do |img|
                    @post.photos.create(image: img.pop)
                end    
            end    
            flash[:notice] = "Saved successfully ..."
            redirect_to posts_path
        else
            flash[:alert] = "#{@post.errors.full_messages.to_sentence}"
            redirect_to posts_path
        end    
    end
    
    def show
        @photos = @post.photos
    end
    
    def destroy
        if @post.user == current_user
            if @post.destroy
                flash[:notice] = "Successfully deleted"
            else
                flash[:alert] = "Something went wrong"    
            end   
        else
            flash[:alert] = "You don't have the permission"     
        end   
        redirect_to root_path
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