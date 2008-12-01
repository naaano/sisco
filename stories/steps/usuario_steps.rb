require File.dirname(__FILE__) + '/../helper'

RE_Usuario      = %r{(?:(?:the )? *(\w+) *)}
RE_Usuario_TYPE = %r{(?: *(\w+)? *)}
steps_for(:usuario) do

  #
  # Setting
  #
  
  Given "an anonymous usuario" do 
    log_out!
  end

  Given "$an $usuario_type usuario with $attributes" do |_, usuario_type, attributes|
    create_usuario! usuario_type, attributes.to_hash_from_story
  end
  
  Given "$an $usuario_type usuario named '$login'" do |_, usuario_type, login|
    create_usuario! usuario_type, named_usuario(login)
  end
  
  Given "$an $usuario_type usuario logged in as '$login'" do |_, usuario_type, login|
    create_usuario! usuario_type, named_usuario(login)
    log_in_usuario!
  end
  
  Given "$actor is logged in" do |_, login|
    log_in_usuario! @usuario_params || named_usuario(login)
  end
  
  Given "there is no $usuario_type usuario named '$login'" do |_, login|
    @usuario = Usuario.find_by_login(login)
    @usuario.destroy! if @usuario
    @usuario.should be_nil
  end
  
  #
  # Actions
  #
  When "$actor logs out" do 
    log_out
  end

  When "$actor registers an account as the preloaded '$login'" do |_, login|
    usuario = named_usuario(login)
    usuario['password_confirmation'] = usuario['password']
    create_usuario usuario
  end

  When "$actor registers an account with $attributes" do |_, attributes|
    create_usuario attributes.to_hash_from_story
  end
  

  When "$actor logs in with $attributes" do |_, attributes|
    log_in_usuario attributes.to_hash_from_story
  end
  
  #
  # Result
  #
  Then "$actor should be invited to sign in" do |_|
    response.should render_template('/sessions/new')
  end
  
  Then "$actor should not be logged in" do |_|
    controller.logged_in?.should_not be_true
  end
    
  Then "$login should be logged in" do |login|
    controller.logged_in?.should be_true
    controller.current_usuario.should === @usuario
    controller.current_usuario.login.should == login
  end
    
end

def named_usuario login
  usuario_params = {
    'admin'   => {'id' => 1, 'login' => 'addie', 'password' => '1234addie', 'email' => 'admin@example.com',       },
    'oona'    => {          'login' => 'oona',   'password' => '1234oona',  'email' => 'unactivated@example.com'},
    'reggie'  => {          'login' => 'reggie', 'password' => 'monkey',    'email' => 'registered@example.com' },
    }
  usuario_params[login.downcase]
end

#
# Usuario account actions.
#
# The ! methods are 'just get the job done'.  It's true, they do some testing of
# their own -- thus un-DRY'ing tests that do and should live in the usuario account
# stories -- but the repetition is ultimately important so that a faulty test setup
# fails early.  
#

def log_out 
  get '/sessions/destroy'
end

def log_out!
  log_out
  response.should redirect_to('/')
  follow_redirect!
end

def create_usuario(usuario_params={})
  @usuario_params       ||= usuario_params
  post "/usuarios", :usuario => usuario_params
  @usuario = Usuario.find_by_login(usuario_params['login'])
end

def create_usuario!(usuario_type, usuario_params)
  usuario_params['password_confirmation'] ||= usuario_params['password'] ||= usuario_params['password']
  create_usuario usuario_params
  response.should redirect_to('/')
  follow_redirect!

end



def log_in_usuario usuario_params=nil
  @usuario_params ||= usuario_params
  usuario_params  ||= @usuario_params
  post "/session", usuario_params
  @usuario = Usuario.find_by_login(usuario_params['login'])
  controller.current_usuario
end

def log_in_usuario! *args
  log_in_usuario *args
  response.should redirect_to('/')
  follow_redirect!
  response.should have_flash("notice", /Logged in successfully/)
end
