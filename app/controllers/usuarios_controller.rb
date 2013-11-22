class UsuariosController < ApplicationController
  def new
  	@usuario = Usuario.new
  end
  def show
    @usuario = Usuario.find(params[:id])
  end
  def create
    @usuario = Usuario.new(user_params)    # Not the final implementation!
    if @usuario.save
      sign_in @usuario
      flash[:success] = "Welcome to Piller!"
      redirect_to @usuario
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:usuario).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
