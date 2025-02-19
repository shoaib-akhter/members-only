class PostsController < ApplicationController
  # Ensure only logged-in users can create posts
  before_action :authenticate_user!, only: [:new, :create]

  # Show all posts
  def index
    @posts = Post.all
  end

  # Render new post form
  def new
    @post = Post.new
  end

  # Handle post submission
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end