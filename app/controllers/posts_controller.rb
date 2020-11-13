class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :new, :update, :destroy, :create]

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
		if @post.save
			flash[:success]="新しく投稿されました"
		    redirect_to root_path
		    else
			redirect_to new_post_path , alert: '投稿内容に不備があります'
	    end
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user
		@comment = PostComment.new
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	 private
	  def post_params
	    params.require(:post).permit(:dish_image, :user_image, :menu_title, :price, :comment, :shop_name, :adress)
	  end
end