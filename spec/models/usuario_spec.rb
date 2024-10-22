# -*- coding: mule-utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe Usuario do
  fixtures :usuarios

  describe 'being created' do
    before do
      @usuario = nil
      @creating_usuario = lambda do
        @usuario = create_usuario
        violated "#{@usuario.errors.full_messages.to_sentence}" if @usuario.new_record?
      end
    end
    
    it 'increments Usuario#count' do
      @creating_usuario.should change(Usuario, :count).by(1)
    end
  end

  #              
  # Validations
  #
 
  it 'requires login' do
    lambda do
      u = create_usuario(:login => nil)
      u.errors.on(:login).should_not be_nil
    end.should_not change(Usuario, :count)
  end

  describe 'allows legitimate logins:' do
    ['123', '1234567890_234567890_234567890_234567890', 
     'hello.-_there@funnychar.com'].each do |login_str|
      it "'#{login_str}'" do
        lambda do
          u = create_usuario(:login => login_str)
          u.errors.on(:login).should     be_nil
        end.should change(Usuario, :count).by(1)
      end
    end
  end
  describe 'disallows illegitimate logins:' do
    ['12', '1234567890_234567890_234567890_234567890_', "tab\t", "newline\n",
     "Iñtërnâtiônàlizætiøn hasn't happened to ruby 1.8 yet", 
     'semicolon;', 'quote"', 'tick\'', 'backtick`', 'percent%', 'plus+', 'space '].each do |login_str|
      it "'#{login_str}'" do
        lambda do
          u = create_usuario(:login => login_str)
          u.errors.on(:login).should_not be_nil
        end.should_not change(Usuario, :count)
      end
    end
  end

  it 'requires password' do
    lambda do
      u = create_usuario(:password => nil)
      u.errors.on(:password).should_not be_nil
    end.should_not change(Usuario, :count)
  end

  it 'requires password confirmation' do
    lambda do
      u = create_usuario(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should_not be_nil
    end.should_not change(Usuario, :count)
  end

  it 'requires email' do
    lambda do
      u = create_usuario(:email => nil)
      u.errors.on(:email).should_not be_nil
    end.should_not change(Usuario, :count)
  end

  describe 'allows legitimate emails:' do
    ['foo@bar.com', 'foo@newskool-tld.museum', 'foo@twoletter-tld.de', 'foo@nonexistant-tld.qq',
     'r@a.wk', '1234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890@gmail.com',
     'hello.-_there@funnychar.com', 'uucp%addr@gmail.com', 'hello+routing-str@gmail.com',
     'domain@can.haz.many.sub.doma.in', 
    ].each do |email_str|
      it "'#{email_str}'" do
        lambda do
          u = create_usuario(:email => email_str)
          u.errors.on(:email).should     be_nil
        end.should change(Usuario, :count).by(1)
      end
    end
  end
  describe 'disallows illegitimate emails' do
    ['!!@nobadchars.com', 'foo@no-rep-dots..com', 'foo@badtld.xxx', 'foo@toolongtld.abcdefg',
     'Iñtërnâtiônàlizætiøn@hasnt.happened.to.email', 'need.domain.and.tld@de', "tab\t", "newline\n",
     'r@.wk', '1234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890-234567890@gmail2.com',
     # these are technically allowed but not seen in practice:
     'uucp!addr@gmail.com', 'semicolon;@gmail.com', 'quote"@gmail.com', 'tick\'@gmail.com', 'backtick`@gmail.com', 'space @gmail.com', 'bracket<@gmail.com', 'bracket>@gmail.com'
    ].each do |email_str|
      it "'#{email_str}'" do
        lambda do
          u = create_usuario(:email => email_str)
          u.errors.on(:email).should_not be_nil
        end.should_not change(Usuario, :count)
      end
    end
  end

  describe 'allows legitimate names:' do
    ['Andre The Giant (7\'4", 520 lb.) -- has a posse', 
     '', '1234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890',
    ].each do |name_str|
      it "'#{name_str}'" do
        lambda do
          u = create_usuario(:name => name_str)
          u.errors.on(:name).should     be_nil
        end.should change(Usuario, :count).by(1)
      end
    end
  end
  describe "disallows illegitimate names" do
    ["tab\t", "newline\n",
     '1234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_234567890_',
     ].each do |name_str|
      it "'#{name_str}'" do
        lambda do
          u = create_usuario(:name => name_str)
          u.errors.on(:name).should_not be_nil
        end.should_not change(Usuario, :count)
      end
    end
  end

  it 'resets password' do
    usuarios(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    Usuario.authenticate('quentin', 'new password').should == usuarios(:quentin)
  end

  it 'does not rehash password' do
    usuarios(:quentin).update_attributes(:login => 'quentin2')
    Usuario.authenticate('quentin2', 'monkey').should == usuarios(:quentin)
  end

  #
  # Authentication
  #

  it 'authenticates usuario' do
    Usuario.authenticate('quentin', 'monkey').should == usuarios(:quentin)
  end

  it "doesn't authenticates usuario with bad password" do
    Usuario.authenticate('quentin', 'monkey').should == usuarios(:quentin)
  end

 if REST_AUTH_SITE_KEY.blank? 
   # old-school passwords
   it "authenticates a user against a hard-coded old-style password" do
     Usuario.authenticate('old_password_holder', 'test').should == usuarios(:old_password_holder)
   end
 else
   it "doesn't authenticate a user against a hard-coded old-style password" do
     Usuario.authenticate('old_password_holder', 'test').should be_nil
   end

   # New installs should bump this up and set REST_AUTH_DIGEST_STRETCHES to give a 10ms encrypt time or so
   desired_encryption_expensiveness_ms = 0.1
   it "takes longer than #{desired_encryption_expensiveness_ms}ms to encrypt a password" do
     test_reps = 100
     start_time = Time.now; test_reps.times{ Usuario.authenticate('quentin', 'monkey'+rand.to_s) }; end_time   = Time.now
     auth_time_ms = 1000 * (end_time - start_time)/test_reps
     auth_time_ms.should > desired_encryption_expensiveness_ms
   end
 end

  #
  # Authentication
  #

  it 'sets remember token' do
    usuarios(:quentin).remember_me
    usuarios(:quentin).remember_token.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.should_not be_nil
  end

  it 'unsets remember token' do
    usuarios(:quentin).remember_me
    usuarios(:quentin).remember_token.should_not be_nil
    usuarios(:quentin).forget_me
    usuarios(:quentin).remember_token.should be_nil
  end

  it 'remembers me for one week' do
    before = 1.week.from_now.utc
    usuarios(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    usuarios(:quentin).remember_token.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

  it 'remembers me until one week' do
    time = 1.week.from_now.utc
    usuarios(:quentin).remember_me_until time
    usuarios(:quentin).remember_token.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.should == time
  end

  it 'remembers me default two weeks' do
    before = 2.weeks.from_now.utc
    usuarios(:quentin).remember_me
    after = 2.weeks.from_now.utc
    usuarios(:quentin).remember_token.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.should_not be_nil
    usuarios(:quentin).remember_token_expires_at.between?(before, after).should be_true
  end

protected
  def create_usuario(options = {})
    record = Usuario.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.save
    record
  end
end
