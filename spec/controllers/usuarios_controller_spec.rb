require File.dirname(__FILE__) + '/../spec_helper'
  
# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe UsuariosController do
  fixtures :usuarios

  it 'allows signup' do
    lambda do
      create_usuario
      response.should be_redirect
    end.should change(Usuario, :count).by(1)
  end

  


  it 'requires login on signup' do
    lambda do
      create_usuario(:login => nil)
      assigns[:usuario].errors.on(:login).should_not be_nil
      response.should be_success
    end.should_not change(Usuario, :count)
  end
  
  it 'requires password on signup' do
    lambda do
      create_usuario(:password => nil)
      assigns[:usuario].errors.on(:password).should_not be_nil
      response.should be_success
    end.should_not change(Usuario, :count)
  end
  
  it 'requires password confirmation on signup' do
    lambda do
      create_usuario(:password_confirmation => nil)
      assigns[:usuario].errors.on(:password_confirmation).should_not be_nil
      response.should be_success
    end.should_not change(Usuario, :count)
  end

  it 'requires email on signup' do
    lambda do
      create_usuario(:email => nil)
      assigns[:usuario].errors.on(:email).should_not be_nil
      response.should be_success
    end.should_not change(Usuario, :count)
  end
  
  
  
  def create_usuario(options = {})
    post :create, :usuario => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
  end
end

describe UsuariosController do
  describe "route generation" do
    it "should route usuarios's 'index' action correctly" do
      route_for(:controller => 'usuarios', :action => 'index').should == "/usuarios"
    end
    
    it "should route usuarios's 'new' action correctly" do
      route_for(:controller => 'usuarios', :action => 'new').should == "/signup"
    end
    
    it "should route {:controller => 'usuarios', :action => 'create'} correctly" do
      route_for(:controller => 'usuarios', :action => 'create').should == "/register"
    end
    
    it "should route usuarios's 'show' action correctly" do
      route_for(:controller => 'usuarios', :action => 'show', :id => '1').should == "/usuarios/1"
    end
    
    it "should route usuarios's 'edit' action correctly" do
      route_for(:controller => 'usuarios', :action => 'edit', :id => '1').should == "/usuarios/1/edit"
    end
    
    it "should route usuarios's 'update' action correctly" do
      route_for(:controller => 'usuarios', :action => 'update', :id => '1').should == "/usuarios/1"
    end
    
    it "should route usuarios's 'destroy' action correctly" do
      route_for(:controller => 'usuarios', :action => 'destroy', :id => '1').should == "/usuarios/1"
    end
  end
  
  describe "route recognition" do
    it "should generate params for usuarios's index action from GET /usuarios" do
      params_from(:get, '/usuarios').should == {:controller => 'usuarios', :action => 'index'}
      params_from(:get, '/usuarios.xml').should == {:controller => 'usuarios', :action => 'index', :format => 'xml'}
      params_from(:get, '/usuarios.json').should == {:controller => 'usuarios', :action => 'index', :format => 'json'}
    end
    
    it "should generate params for usuarios's new action from GET /usuarios" do
      params_from(:get, '/usuarios/new').should == {:controller => 'usuarios', :action => 'new'}
      params_from(:get, '/usuarios/new.xml').should == {:controller => 'usuarios', :action => 'new', :format => 'xml'}
      params_from(:get, '/usuarios/new.json').should == {:controller => 'usuarios', :action => 'new', :format => 'json'}
    end
    
    it "should generate params for usuarios's create action from POST /usuarios" do
      params_from(:post, '/usuarios').should == {:controller => 'usuarios', :action => 'create'}
      params_from(:post, '/usuarios.xml').should == {:controller => 'usuarios', :action => 'create', :format => 'xml'}
      params_from(:post, '/usuarios.json').should == {:controller => 'usuarios', :action => 'create', :format => 'json'}
    end
    
    it "should generate params for usuarios's show action from GET /usuarios/1" do
      params_from(:get , '/usuarios/1').should == {:controller => 'usuarios', :action => 'show', :id => '1'}
      params_from(:get , '/usuarios/1.xml').should == {:controller => 'usuarios', :action => 'show', :id => '1', :format => 'xml'}
      params_from(:get , '/usuarios/1.json').should == {:controller => 'usuarios', :action => 'show', :id => '1', :format => 'json'}
    end
    
    it "should generate params for usuarios's edit action from GET /usuarios/1/edit" do
      params_from(:get , '/usuarios/1/edit').should == {:controller => 'usuarios', :action => 'edit', :id => '1'}
    end
    
    it "should generate params {:controller => 'usuarios', :action => update', :id => '1'} from PUT /usuarios/1" do
      params_from(:put , '/usuarios/1').should == {:controller => 'usuarios', :action => 'update', :id => '1'}
      params_from(:put , '/usuarios/1.xml').should == {:controller => 'usuarios', :action => 'update', :id => '1', :format => 'xml'}
      params_from(:put , '/usuarios/1.json').should == {:controller => 'usuarios', :action => 'update', :id => '1', :format => 'json'}
    end
    
    it "should generate params for usuarios's destroy action from DELETE /usuarios/1" do
      params_from(:delete, '/usuarios/1').should == {:controller => 'usuarios', :action => 'destroy', :id => '1'}
      params_from(:delete, '/usuarios/1.xml').should == {:controller => 'usuarios', :action => 'destroy', :id => '1', :format => 'xml'}
      params_from(:delete, '/usuarios/1.json').should == {:controller => 'usuarios', :action => 'destroy', :id => '1', :format => 'json'}
    end
  end
  
  describe "named routing" do
    before(:each) do
      get :new
    end
    
    it "should route usuarios_path() to /usuarios" do
      usuarios_path().should == "/usuarios"
      formatted_usuarios_path(:format => 'xml').should == "/usuarios.xml"
      formatted_usuarios_path(:format => 'json').should == "/usuarios.json"
    end
    
    it "should route new_usuario_path() to /usuarios/new" do
      new_usuario_path().should == "/usuarios/new"
      formatted_new_usuario_path(:format => 'xml').should == "/usuarios/new.xml"
      formatted_new_usuario_path(:format => 'json').should == "/usuarios/new.json"
    end
    
    it "should route usuario_(:id => '1') to /usuarios/1" do
      usuario_path(:id => '1').should == "/usuarios/1"
      formatted_usuario_path(:id => '1', :format => 'xml').should == "/usuarios/1.xml"
      formatted_usuario_path(:id => '1', :format => 'json').should == "/usuarios/1.json"
    end
    
    it "should route edit_usuario_path(:id => '1') to /usuarios/1/edit" do
      edit_usuario_path(:id => '1').should == "/usuarios/1/edit"
    end
  end
  
end
