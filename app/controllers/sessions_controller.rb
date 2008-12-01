class SessionsController < ApplicationController
  layout 'portada'
  def login
    if request.post?
      if session[:usuario] = Usuario.authenticate(params[:login], params[:password])
        #flash[:message]  = "Login OK"
        redirect_to_stored
      else
        flash[:warning] = "Usuario o contraseña inválida"
      end
    end

  end
  
  def logout
    session[:usuario] = nil
    redirect_to :controller => 'login'
  end
  
  def show
    render :text => session[:usuario].id.to_s
  end

end
