class AuthorsController < ApplicationController
  def show
    find_author
  end

  def new
    @author = Author.new
  end

  def edit
    find_author
  end

  def create
    @author = Author.create(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def update
    @author.update(author_params)
    if @author.valid?
      redirect_to author_path(@author)
    else
      render :edit
    end
  end
  
  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
