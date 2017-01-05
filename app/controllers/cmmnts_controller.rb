class CmmntsController < ApplicationController
  before_action :load_params

  def create
    @cmmnt = @post.cmmnts.create(params[:cmmnt].permit( :body))
    redirect_to rubric_post_path(@rubric, @post)
  end

  def destroy
    @cmmnt = Cmmnt.find(params[:id])
    @cmmnt.destroy

    redirect_to rubric_post_path(@rubric, @post)
  end

  def load_params
    @rubric = Rubric.find(params[:rubric_id])
    @post = @rubric.posts.find(params[:post_id])
  end
end
