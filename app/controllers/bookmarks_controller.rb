class BookmarksController < ApplicationController
    before_action :authenticate_user!

    def create
        
        @bookmark = current_user.bookmarks.build(bookmark_params)
        @post = @bookmark.post
        if @bookmark.save
            respond_to :js
        else
            flash[:error] =  "Something Went Wrong"    
        end    
    end
    
    
    def destroy
        @bookmark = Bookmark.find(params[:id])
        @post = @bookmark.post
        if @bookmark.destroy
            respond_to :js
        else
            flash[:alert] = "Something went wrong"   
        end     
    end    

    private 

    def bookmark_params
        params.permit(:post_id, :user_id)
    end    
end    