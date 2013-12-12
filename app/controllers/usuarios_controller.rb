class UsuariosController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
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

   def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario destroyed."
    redirect_to usuarios_path
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

   def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      flash[:success] = "Profile updated"
      sign_in @usuario
      redirect_to @usuario
    else
      render 'edit'
    end
  end


  private

    def user_params
      params.require(:usuario).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
