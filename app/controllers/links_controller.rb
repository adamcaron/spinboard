class LinksController < ApplicationController
  helper LinksHelper

  def index
    redirect_to login_path unless current_user
    @link = Link.new
    @links = Link.all.where(user_id: current_user).order('created_at DESC')
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    if params[:update_status]
      link = Link.find(params[:id])
      link.change_status
      render json: link
    else
      link = Link.find(params[:id])
      link.update!(link_params)
      if link.save
        flash[:notice] = "Link updated!"
        redirect_to root_path
      else
        flash[:error] = "Link not updated - Please try updating link again"
        render :edit
      end
    end
  end

  def untag
    link = Link.find(params[:id])
    link.tags.delete(params[:tag_id])
    redirect_to root_path
  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end