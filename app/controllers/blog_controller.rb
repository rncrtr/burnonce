class BlogController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  before_action :disallow_user, :except => [:index, :show]

  def index
    @blogs = Post.order("created_at desc")
  end

  def new
    @blog = current_user.posts.new
  end

  def create
    @blog = current_user.posts.new(blog_params)
    if @blog.save
       redirect_to blog_index_path, notice: "Post Saved"
      else
       redirect_to new_blog_path, notice: "Post not saved, woops"
      end
  end

  def show
    @blog = Post.find(params[:id])
  end

private

  def blog_params
    params.require(:post).permit(:user_id, :title, :body)
  end

end
