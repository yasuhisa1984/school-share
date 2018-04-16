class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @skills = @post.skills
    @purposes = @post.purposes
  end
end
