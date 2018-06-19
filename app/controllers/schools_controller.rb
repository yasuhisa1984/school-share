class SchoolsController < ApplicationController
  before_action :set_form, only: %i[index search new show]
  layout '_base'

  def index
    @search_form = School::SearchForm.new
    @schools = School.all.page(params[:page])
  end

  def search
    @search_form = School::SearchForm.new(search_params)
    @schools = @search_form.search.page(params[:page])
    render :index
  end

  def new
    @post = Post.new
    @post.build_info
  end

  def show
    @search_form = School::SearchForm.new
    @school = School.find(params[:id])
    @addresses = @school.addresses
    @courses = @school.courses
  end

  private
  def search_params
    params.require(:search).permit(:school_name, :purpose_name, :address_area, :skill_name, :couse_name)
  end

  def set_form
    @areas = %i[関東地方 中部地方 北海道・東北地方 近畿地方 四国地方 中国地方 九州・沖縄地方]
    @purposes = Purpose.all
    @schools = School.all
  end
 end
