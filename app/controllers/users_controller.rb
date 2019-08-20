class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_story, only: :show

  def show
    @stories = Story.where(user: @user)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:user).permit(:first_name)
  end
end
