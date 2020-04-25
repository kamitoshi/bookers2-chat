class RelationshipsController < ApplicationController

  def create
    current_user.follower.create(followed_id: params[:id])
    flash[:success] = "フォローしました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.follower.find_by(followed_id: params[:id]).destroy
    flash[:danger] = "フォローを外しました"
    redirect_back(fallback_location: root_path)
  end


end
