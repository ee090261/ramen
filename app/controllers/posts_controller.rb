class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user.id = current_user.id
		@post.save
		flash[:notice]="新しく投稿されました"
		redirect_to book_path  #if文で正しく投稿できていない記述は後日

	end

	 private
	  def post_params
	    params.require(:user).permit(:dish_image, :menu_title, :price, :comment)
	  end

end
