class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render "create.js.erb"
    else
      flash[:danger] = "投稿できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      redirect_back(fallback_location: root_path)
    else
      @comment.destroy
      render "destroy.js.erb"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :book_id)
  end


end
