class TagsController < ApplicationController
  def create
    tag = Tag.find_or_create_by(title: params[:tag][:title].downcase)
    link = Link.find(params[:link_id])
    link.tags << tag
    redirect_to root_path
  end
end