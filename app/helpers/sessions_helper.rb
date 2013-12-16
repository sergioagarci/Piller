module SessionsHelper
  def sign_in(usuario)
    remember_token = Usuario.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    usuario.update_attribute(:remember_token, Usuario.encrypt(remember_token))
    self.current_usuario = usuario
  end
  def signed_in?
    !current_usuario.nil?
  end

  def current_usuario=(usuario)
    @current_usuario = usuario
  end

  def current_usuario
    remember_token = Usuario.encrypt(cookies[:remember_token])
    @current_usuario ||= Usuario.find_by(remember_token: remember_token)
  end

  def current_usuario?(usuario)
    usuario == current_usuario
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    self.current_usuario = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
