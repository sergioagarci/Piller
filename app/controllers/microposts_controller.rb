class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def destroy
  end

  def create
    @micropost = current_usuario.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost creado!"
      redirect_to root_url
    else
      @feed_items2 = []
      render 'static_pages/home'
    end
  end

  def show
    @found = current_usuario.microposts.where(found_params)
    @microvideos = @usuario.microvideos.paginate(page: params[:page])
    @microposts = @usuario.microposts.paginate(page: params[:page])
  end
  
  def get
    @microposts = @usuario.microposts.paginate(page: params[:page])
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def found2
      @search = Micropost.search(params[:q])
      @micropost = @search.result
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :categoria)
    end

    def found_params
      params.require(:micropost).permit(:content, :categoria)
    end

    def correct_user
        @micropost = current_usuario.microposts.find(params[:id])
    rescue
        redirect_to root_url
    end
end