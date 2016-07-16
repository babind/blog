class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment 
    @comment = @post.comments.find_by_id(params[:id])
    redirect_to post_books_url(@post), :alert => "comment can't be found." unless @post

  end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

  def index
      @comments = @post.comments
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
     @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
     @comment = @post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def edit
     @comment = @post.comments.find(params[:id])
  end

  def create
      # @comment = @post.comments.create(params[:comment])
      @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    def update
       @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   def destroy
       @comment = @post.comments.find(params[:id])
      @comment.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(post_comments_url) }
      format.xml  { head :ok }
    end
  end
 
end