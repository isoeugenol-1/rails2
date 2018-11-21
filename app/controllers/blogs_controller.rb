class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :login_check, only: [:show, :edit, :new, :destroy, :update]
  before_action :current_check, only: [:destroy, :edit, :update]
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
    @blog.user_id = current_user.id
    if @blog.save
      #ContactMailer.contact_mail(current_user,@blog).deliver
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
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
    if @blog.title =="" || @blog.content ==""
      flash[:error] =  "内容を入力してください"
      redirect_to new_blog_path
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :@curuser, :image, :image_cache)
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
  
  def current_check
    if @blog.user_id != current_user.id
      flash[:error] =  "current error"
      redirect_to blogs_path
    end
  end
end