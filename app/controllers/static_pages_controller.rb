class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @microvideo  = current_usuario.microvideos.build
      @feed_items = current_usuario.feed.paginate(page: params[:page])
      @micropost  = current_usuario.microposts.build
      @feed_items2 = current_usuario.feed2.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end

