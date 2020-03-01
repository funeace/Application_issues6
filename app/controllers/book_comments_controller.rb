class BookCommentsController < ApplicationController
  def create
      @book_detail = Book.find(params[:book_id])
      @book_comment = current_user.book_comments.new(book_comment_params)
      @book_comment.book_id = @book_detail.id
      @book_comment.save
      redirect_back(fallback_location: root_path)
  end
  
  def destroy
    BookComment.find(params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:user_id,:book_id,:comment)
  end
end
