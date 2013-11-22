class UsuariosController < ApplicationController
  def new
  	@usuario = Usuario.new
  end
  def show
    @usuario = Usuario.find(params[:id])
  end
  def create
    @usuario = Usuario.new(params[:usuario])    # Not the final implementation!
    if @usuario.save
      flash[:success] = "Welcome to Piller!"
      redirect_to @usuario
    else
      render 'new'
    end
  end

  private

    def usuario_params
      params.require(:usuario).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
