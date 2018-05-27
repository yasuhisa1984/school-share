class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show]
  before_action :set_form, only: %i[new]
  layout '_base'

  def index
    @posts = Post.all
  end

  def new
    @search_form = School::SearchForm.new
    @post = Post.new
    @post.build_info
  end

  def search
    @search_form = School::SearchForm.new(search_params)
    @schools = @search_form.search.page(params[:page])
    render :new
  end

  def show
    @school = @post.school
    @skills = @post.skills
    @post_skills = @post.skills
    @purposes = @post.purposes
    @course = @post.course
    gon.skill = []
    gon.point = []

    @skills.each do |skill|
      gon.point << skill.scores.first.point.to_i
      gon.skill << skill.name
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_form
    @schools = School.all.page(params[:page])
  end

  def search_params
    params.require(:search).permit(:school_name, :purpose_name, :address_area, :skill_name)
  end
end
