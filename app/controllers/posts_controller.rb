class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post =Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post)
	end

	def create
		@post = current_user.posts.new(post_params)
		@post.save
		flash[:notice]="新しく投稿されました"
		redirect_to root_path  #if文で正しく投稿できていない記述は後日
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user
		@comment = PostComment.new
	end

	 private
	  def post_params
	    params.require(:post).permit(:dish_image, :menu_title, :price, :comment, :shop_name, :adress)
	  end

end

