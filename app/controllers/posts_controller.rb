class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		@post.save
		flash[:notice]="新しく投稿されました"
		redirect_to root_path  #if文で正しく投稿できていない記述は後日
	end

	 private
	  def post_params
	    params.require(:post).permit(:dish_image, :menu_title, :price, :comment)
	  end

end

