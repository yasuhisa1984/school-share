class Schools::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: %i[index new edit confirm]
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.where(school_id: params[:school_id]).page(params[:page])
    @search_form = Post::SearchForm.new
  end

  def new
    @school = School.find(params.require(:school_id))
    @post = Post.new
    @post.build_info
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      @post.score_update(score_update_params)
      redirect_to root_path, notice: "投稿を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '投稿を削除しました!'
    else
      render :edit
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_form
    @schools = School.all
    @purposes = Purpose.all
    @points = Array.new
    @courses = School.find(params[:school_id]).courses
    @school_periods = SchoolPeriod.all
  end

  def score_params
    params.require(:post_score).require(["0","1","2","3","4"]).map! {|item| item.permit("point")}
  end

  def score_update_params
    params_values = params.require(:post_score).keys
    if params_values == ["0","1","2"] ||  params_values == ["0","1","2","3"] ||  params_values == ["0","1","2","3","4"]
      params.require(:post_score).require(params_values).map! { |item| item.permit("point") }
    end
  end

  def post_params
    params.require(:post).permit(:work, :story, :school_period_id, :school_id,
                                 :course_id, skills_attributes: [:id, :name],
                                 post_purposes_attributes: [:id, :purpose_id])
  end
end
