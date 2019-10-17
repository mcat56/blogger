class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    taggings = Tagging.where(tag_id: params[:id])
    taggings.each do |tagging|
      Tagging.destroy(tagging.id)
    end
    Tag.destroy(params[:id])

    redirect_to tags_path
  end


end
