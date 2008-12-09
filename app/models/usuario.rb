class Usuario < ActiveRecord::Base
  include Authentication
#  include Authentication::ByPassword
#  include Authentication::ByCookieToken
  
  has_one :puesto
  has_many :trazas
  has_many :documentos
  has_many :comentarios # SOLO PARA DEPURACION BORRAR EN PRODUCCION FINAL SISCO 3
  has_many :correcciones # SOLO PARA DEPURACION BORRAR EN PRODUCCION FINAL SISCO 3
  has_one :buzon, :through => :puesto
  
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40, :too_short => "es el login del computador", :too_long => "solo el login, sin el @minrel.gov.cl"
  validates_uniqueness_of   :login,    :case_sensitive => false
#  validates_format_of       :login,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

#  validates_format_of       :nombre,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of       :nombre,     :within => 3..100, :too_short => "es tu verdadero nombre, como Andrea, etc.", :too_long => "sólo el nombre, por ej.: Amelia"
  validates_length_of       :apellido,     :within => 3..100, :too_short => "es tu apellido, o los 2 mejor aún", :too_long => "tan laaargo es tu apellido? si es asi llamanos"

#  validates_presence_of     :email
#  validates_length_of       :email,    :within => 6..100 #r@a.wk
#  validates_uniqueness_of   :email,    :case_sensitive => false
#  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD

  validates_length_of       :password, :minimum => 4, :message => "si usas una clave tan corta, algún malvado te puede hacer una broma pesada"
  validates_confirmation_of :password

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible  :login, :nombre, :password, :password_confirmation, :admin, :dominio



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_by_login(login, :include => [:puesto]) # need to get the salt
    u && u.password == password ? u : nil
  end
  
  def es_admin?
    return self.admin
  end
  
  def es_opartes?
    return true if self.has_puesto? and self.puesto.opartes
  end
  
  def es_firmante?
    return self.puesto.firmante #FIXME se le olvido por que, revisar
  end
  
  def es_editor?
    return self.puesto.editor #FIXME
  end
  
  def ingresa_papel?
    return self.puesto.ingreso_papel #FIXME
  end
  
  def has_puesto?
    return true if not self.puesto.nil?
    return false
  end
  
  def to_label
    nombre + ' ' + apellido
  end
  
  fields do
    login :string
    dominio :string, :default => 'minrel.gov.cl' #no se si este default funciona, pero de cualquier forma no es imprescindible
    password :string
    password_confirmation :string
    nombre :string
    apellido :string
    admin :boolean, :default => false
  end

  protected
    
  def authorized_for_update?
    return self.id == current_user.id || current_user.admin
  end


end
