class PostsController < ApplicationController
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, success: 'Article was created'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update_attributes(post_params)
            redirect_to @post, success: 'Article was updated'
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, warning: 'Article deleted'
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :summary, :body)
    end
end