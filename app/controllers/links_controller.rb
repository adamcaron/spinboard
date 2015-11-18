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
      flash.now[:errors] = @link.errors.full_messages.join(", ")
      render :index
    end
  end

  def update
    if params[:update_status]
      link = Link.find(params[:id])
      link.change_status
      render json: link
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end