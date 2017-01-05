class RubricsController < ApplicationController
  before_action :load_params, :only => [:show, :edit, :update, :destroy]

  def index
    @rubric = Rubric.paginate(:page => params[:page], :per_page => 4).order('created_at DESC')
  end

  def new
    @rubric = Rubric.new
  end

  def show

    redirect_to rubric_posts_path(@rubric)
  end

  def create
    @rubric = Rubric.new(rubric_params)

    if @rubric.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @rubric.update_attributes(rubric_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @rubric.destroy

    redirect_to rubrics_path
  end

  def load_params
    @rubric = Rubric.find(params[:id])
  end

  private

  def rubric_params
    params.require(:rubric).permit(:title)
  end
end
