class BooksController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit]
  def index
    if params[:category].blank?
    @books = Book.all.order('author ASC, title ASC')
  else
    @category_id = Category.find_by(name: params[:category]).id
    @books = Book.where(:category_id => @category_id).order("author ASC, title ASC")
  end
  end

  def show
    @book = Book.find(params[:id])
    if @book.reviews.blank?
      @average_review = 0;
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def new
    @book = current_user.books.new
    @categories = Category.all.map{|genre|[genre.name, genre.id]}
  end

  def create
    @book = current_user.books.new(book_params)
    @book.category_id = params[:category_id]
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all.map{|genre|[genre.name, genre.id]}
  end

  def update
    @book = Book.find(params[:id])
    @book.category_id = params[:category_id]
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :description, :category_id, :book_img)
  end

end
