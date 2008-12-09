# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #helper :all # include all helpers, all the time
  
  ActiveScaffold::Localization.lang = "es-es"
  
  #  include AuthenticatedSystem
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery  :secret => '9d0d5af8162696f3bd2f43c670185bda'
  
  layout 'default'
  
  
  my_formats = {
    :default  => '%l:%M %p, %d %b %y',
    :hora => '%l:%M %p',
    :fecha => '%d %b %y'
  }
  
  ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(my_formats)
  ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(my_formats)
  
  
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
    config.create.link.label = "Nuevo"
    config.search.link.label = "Buscar"
    config.update.link.label = "Editar"
    config.delete.link.label = "Borrar"
    config.show.link.label   = "Ver"
    config.security.current_user_method = :current_user
    config.dhtml_history = false
  end
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging "Session ID"
  #requires_authentication :using => :authenticate
  before_filter :login_required, :except => ["login", "generar", "firmar", "gen_rexml", "subir", "get_xml", "prepara_registro"]
  
  def current_user
    session[:usuario]
  end
  
  def active_scaffold_refresh_row(record = nil)
    record = @record unless record
    
    row_id = element_row_id(:action => :list, :id => record.id)
    
    render :update do |page|
      page.replace row_id, :partial => 'list_record', :locals => { :record => record }
      page << "ActiveScaffold.stripe('#{active_scaffold_tbody_id}');"
      page.replace_html active_scaffold_messages_id, :partial =>'messages'
      page.visual_effect :highlight, row_id
    end
    
  end 
  
  protected
  
  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to return_to
    else
      if current_user.es_opartes?
        redirect_to :controller=>'entrada', :action=>'index'
      else
        redirect_to :controller=>'propio', :action => 'index'
      end
    end
  end
  
  def do_update_select_column
    @record = find_if_allowed(params[:id], :update)
    @assoc = @record.class.reflect_on_all_associations.detect{|x| x.primary_key_name == params[:column]}
    if @record.authorized_for?(:action => :update, :column => params[:column])
      @record.update_attributes(params[:column] => params[:value])
    end
  end 
  
  private
  
  
  def login_required
    if session[:usuario]
      return true
    end
    flash[:warning]='Por favor ingrese para continuar'
    session[:return_to]=request.request_uri
    redirect_to :controller => "sessions", :action => "login"
    return false 
  end
  
  
  
  
end
