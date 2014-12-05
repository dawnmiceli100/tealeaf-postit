class CommentsController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    #the user is set this way temporarily until authentication is in place
    @comment.user = @post.user
    
    if @comment.save
      flash[:notice] = "You comment has been added."
      redirect_to post_path(@post)
    else
      render '/posts/show'
    end    
  end 

  private

  def comment_params
    params.require(:comment).permit(:body) 
  end  
end  