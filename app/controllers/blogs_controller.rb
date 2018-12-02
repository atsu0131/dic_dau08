class BlogsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @blogs = @category.blogs
  end

  def new
    @category = Category.find(params[:category_id])
    @blog = @category.blogs.build
  end

  def create
    @category = Category.find(params[:category_id])
    @blog = @category.blogs.build(blog_params)
    if @blog.save(blog_params)
      redirect_to category_blogs_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @blog = @category.blogs.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @blog = @category.blogs.find(params[:id])
    if @blog.update(blog_params)
      redirect_to category_blogs_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @blog = @category.blogs.find(params[:id])
    @blog.destroy
    redirect_to category_blogs_path
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
