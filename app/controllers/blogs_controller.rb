class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :login_check, only: [:show, :edit, :new, :destroy, :update]
  include ApplicationHelper
  def index
    @blog = Blog.all
  end
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  def edit
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  def confirm
    @blog = Blog.new(blog_params)
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def login_check
    unless logged_in?
      flash[:error] =  "ログインしてください"
      redirect_to new_session_path
    end
  end
end