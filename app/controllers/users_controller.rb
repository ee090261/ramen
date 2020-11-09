class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def about
  end

  def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  redirect_to root_path
  end

private
	def user_params
		params.require(:user).permit(:name, :user_image, :introduction, :prefecture, :genres)
	end
end

