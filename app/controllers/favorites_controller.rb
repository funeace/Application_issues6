class FavoritesController < ApplicationController
  before_action :set_book_detail
  def create
    @book_detail = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book_detail.id)
    @favorite.save
    # redirect_back(fallback_location: root_path)    
  end

  def destroy
    @book_detail = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book_detail.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_book_detail
    @book_detail = Book.find(params[:book_id])
  end

end
