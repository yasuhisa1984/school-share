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
    @skills = @post.skills
    @purposes = @post.purposes
  end

  def create
    @post = current_user.posts.build(post_params)
    skill_registered = @post.skill_already_register?
    @post.skills = @post.skill_duplication_remove

    if @post.save
      @post.register_middle_table
      @post.register_middle_skill_table(skill_registered[:post_skills],skill_registered[:school_skills])
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
  end

  def post_params
    params.require(:post).permit(:work, :story, skills_attributes: :name, post_purposes_attributes: :purpose_id, post_schools_attributes: :school_id)
  end
end
