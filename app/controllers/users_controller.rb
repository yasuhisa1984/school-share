class UsersController < ApplicationController
  layout '_base'

  def show
    @user = User.find(params[:id])
  end
end
