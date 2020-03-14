class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    #puts "test index"
  end

  def create
  		flash[:notice] = "Book was successfully created."
        @book = Book.new(book_params)

        if @book.save
          redirect_to book_path(@book.id)
        else
          @books = Book.all
          #redirect_to books_path
          render :index
        end
  end
  def top
  end

  def show
       @book = Book.find(params[:id])
  end

  def edit
	   flash[:notice] = "Book was successfully updated."
       @book = Book.find(params[:id])
  end

  def update
       book = Book.find(params[:id])
       book.update(book_params)
       redirect_to book_path(book.id)
  end


  def destroy
       book = Book.find(params[:id])
       book.destroy
       redirect_to books_path

  end

private
  def book_params
      params.require(:book).permit(:title, :body)
  end



end
