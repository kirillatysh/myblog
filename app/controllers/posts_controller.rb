class PostsController < ApplicationController
  before_action :load_rubric_params
  before_action :load_post_params, :only => [:show, :edit, :destroy]

  def index
    @posts = @rubric.posts
  end

  def new
    @post = @rubric.posts.new
  end

  def create
    @post = @rubric.posts.create(params[:post].permit(:title, :body))
    if @rubric.save
      redirect_to rubric_path(@rubric)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to rubric_post_path(@rubric, @post)
    end
  end

  def destroy
    @post.destroy

    redirect_to rubric_path(@rubric)
  end

  def load_rubric_params
    @rubric = Rubric.find(params[:rubric_id])
  end

  def load_post_params
    @post = @rubric.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:rubric).permit(:title, :body)
  end
end
