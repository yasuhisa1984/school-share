class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @schools = School.all
  end

  def show
    @skills = @post.skills
    @purposes = @post.purposes
  end

  def create
    @post = Post.new(work: post_params[:story], story: post_params[:work])
    @post.user_id = current_user.id
    @post.skills.build(name: post_params[:skills])
    @post.purposes.build(name: post_params[:purposes])
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      render "new"
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:schools, :work, :story, :purposes, :skills)
  end
end
