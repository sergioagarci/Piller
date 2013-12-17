class MicrovideosController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :found]

  def create
    @microvideo = current_usuario.microvideos.build(microvideo_params)
    if @microvideo.save
      flash[:success] = "Microvideo creado!"
      redirect_to home2_path
    else
      @feed_items = []
      render 'static_pages/home2'
    end
  end

  def destroy
    @microvideo.destroy
    redirect_to root_url
  end

  def get
  end

  def found
      @search = Microvideo.search(params[:q])
      @microvideo = @search.result
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

