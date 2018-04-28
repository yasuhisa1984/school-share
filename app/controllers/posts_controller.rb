class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show]
  before_action :set_form, only: [:new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.build_info
  end

  def show
    @school = @post.school
    @skills = @post.skills
    @post_skills = @post.skills
    @purposes = @post.purposes
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.skills = @post.skill_remove_nil

    if @post.save
      @post.register_table(score_params)
      redirect_to root_path, notice: "投稿しました"
    else
      render :new
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_form
    @schools = School.all
    @purposes = Purpose.all
    @points = [1,2,3,4,5]
  end

  def score_params
    params.require(:post_score).require(["0","1","2","3","4"]).map! {|item| item.permit("point")}
  end

  def post_params
    params.require(:post).permit(:work, :story, :school_id, skills_attributes: :name, post_purposes_attributes: :purpose_id)
  end
end
