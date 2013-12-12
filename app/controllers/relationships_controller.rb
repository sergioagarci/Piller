class RelationshipsController < ApplicationController
  before_action :signed_in_usuario

  def create
    @usuario = User.find(params[:relationship][:followed_id])
    current_usuario.follow!(@usuario)
    redirect_to @usuario
  end

  def destroy
    @usuario = Relationship.find(params[:id]).followed
    current_usuario.unfollow!(@usuario)
    redirect_to @usuario
  end
end