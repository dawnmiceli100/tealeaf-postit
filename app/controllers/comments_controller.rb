class CommentsController < ApplicationController

  before_action :require_user

  def create

    @post = Post.find_by(slug: params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = "You comment has been added."
      redirect_to post_path(@post)
    else
      flash[:error] = "Your comment can't be blank."
      redirect_to :back
      #render '/posts/show'
    end    
  end 

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    # redirect_to :back for html
    # use the response_to block below for ajaxified voting
    respond_to do |format|
      format.html do
        if vote.valid?
          flash[:notice] = "Your vote was counted." 
        else
          flash[:alert] = "You have already voted for this comment." 
        end

        redirect_to :back 
      end
           
      format.js  do #this will render the vote.js.erb template
        if vote.valid?
          @type = "notice"
          @name = "success"
          @msg = "Your vote was counted."
        else
          @type = "alert"
          @name = "error" 
          @msg = "You have already voted for this comment."  
        end
      end 
    end    
  end  

  private

  def comment_params
    params.require(:comment).permit(:body) 
  end  
end  