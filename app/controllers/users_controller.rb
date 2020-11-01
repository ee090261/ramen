class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  end

private
	def user_params
		params.require(:user).permit(:name, :user_image, :introduction, :prefecture, :genres)
	end
end
