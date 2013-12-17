class MicrovideosController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def destroy
  end

  def create
    @microvideo = current_usuario.microvideos.build(microvideo_params)
    if @microvideo.save
      flash[:success] = "Microvideo creado!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @microvideo.destroy
    redirect_to root_url
  end

  private
    def microvideo_params
      params.require(:microvideo).permit(:content, :titulo, :comentario, :categoria)
    end

    def correct_user
        @microvideo = current_usuario.microvideos.find(params[:id])
    rescue
        redirect_to root_url
    end
end

