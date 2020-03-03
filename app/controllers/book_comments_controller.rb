class BookCommentsController < ApplicationController
  before_action :book_param,only: [:create,:destroy]
  # before_action :comment_param , only:[:destroy]

  def create
      @book_comment = current_user.book_comments.new(book_comment_params)
      @book_comment.book_id = @book_detail.id
      @book_comment.save

      # 表示用。後で名前見やすくする
      @book_comments = @book_detail.book_comments.all
  end
  

  def destroy
    @comment = BookComment.find_by(book_id: @book_detail.id,user_id: current_user.id)
    @book_comments = @book_detail.book_comments.all
    
    if @comment.user.id == current_user.id
      @comment.destroy
    end
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:user_id,:book_id,:comment)
  end

  def book_param
    @book_detail = Book.find(params[:book_id])
  end


end
