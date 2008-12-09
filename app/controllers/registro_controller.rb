require 'csv'
class RegistroController < ApplicationController
  layout 'portada'
  before_filter :sesion_falsa
  active_scaffold :usuario do |config|
    config.label = "Registro"
    config.actions.exclude :delete, :update
    config.create.columns = [:nombre, :apellido, :login, :password, :password_confirmation, :puesto]
    config.columns[:login].label = "Correo institucional"
    config.columns[:login].description = "por ejemplo: jperez si su correo es jperez@minrel.gov.cl"
    config.columns[:password_confirmation].label = "Repita su password"
    
  end
  
  def redirect_to_main
    session[:usuario] = nil
    redirect_to login_url
  end
  
  def index
    session[:usuario] = nil
    redirect_to login_url
  end
  
  def prepara_registro
    if params[:record].nil?
      redirect_to :action => 'new'
    else
      session[:usuario] = nil
      redirect_to login_url
    end
  end
  
  def sesion_falsa
    if session[:usuario].nil?
      session[:usuario] = Usuario.authenticate("hastudillo", "escudo")
    end
  end
  
  def do_new
    @record = Usuario.new
    @record.puesto = Puesto.new(:nombre => "Secretaria", :cargo_id => 1)
  end
  
  def list
    session[:usuario] = nil
    redirect_to login_url
  end
  
  def carga_etapas
    url = "/home/nano/"  + "etapas_sisco1.csv"
    begin
      CSV::Reader.parse(File.open(url, 'rb')) do |row|
        # p row
        b = Buzon.new
        b.nombre = row[0]
        b.externo = false
        b.folio = 1
        b.sigla = row[0].split.first.upcase
        b.save!
      end
    end
    
  end
  
  
  protected
  
  def before_create_save(record)
    record.login.gsub!(/@.+/,'') unless record.login.nil? # si la persona puso el mail completo, le sacamos el @minrel...
    record.dominio = "minrel.gov.cl"
    record.puesto.opartes = true
    record.puesto.firmante = false
    record.puesto.editor = false
    record.puesto.ingreso_papel = true
  end
  
  def self.active_scaffold_controller_for(klass)
    return PuestosregistroController if klass == Puesto
    return "#{klass}ScaffoldController".constantize rescue super
  end
  
  
end
