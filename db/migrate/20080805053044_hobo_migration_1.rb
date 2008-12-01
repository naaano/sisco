class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string  :login
      t.string  :name
      t.string  :apellido
      t.string  :email
      t.boolean :admin
      t.string  :password
      t.string  :password_confirmation
    end
    
    create_table :rotaciones do |t|
      t.integer  :puesto_id, :nil => false
      t.integer  :usuario_id, :nil => false
      t.boolean  :asigna, :default => true
      t.datetime :created_at
    end
    
    create_table :clasificaciones do |t|
      t.string   :nombre, :name => true
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :puestos do |t|
      t.string   :nombre, :name => true
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :documentos do |t|
      t.integer  :buzon_id
      t.integer  :usuario_id
      t.string   :detalle_origen
      t.string   :titulo, :name => true
      t.integer  :digital
      t.integer  :tipo_id
      t.integer  :clasificacion_id
      t.integer  :accion_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :acciones do |t|
      t.string   :nombre, :name => true
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :carpetas do |t|
      t.string  :nombre, :name => true
      t.integer :buzon_id
    end
    
    create_table :tipos do |t|
      t.string   :nombre, :name => true
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :cargos do |t|
      t.string :nombre, :name => true
    end
    
    create_table :copias do |t|
      t.integer  :documento_id
      t.integer  :copia
      t.integer  :carpeta_id
      t.integer  :estado_id
      t.integer  :buzon_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :notas do |t|
      t.string   :texto
      t.integer  :copia_id
      t.integer  :puesto_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :estados do |t|
      t.string   :nombre, :name => true
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :guias do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :copias_guias do |t|
      t.integer :copia_id
      t.integer :guia_id
    end
    
    create_table :jerarquias do |t|
      t.integer :parent_id
      t.integer :posicion
      t.string  :nombre, :name => true
    end
    
    create_table :buzones do |t|
      t.string   :nombre, :name => true
      t.string   :clave
      t.string   :descripcion
      t.integer  :folio
      t.integer  :usuario_id
      t.integer  :jerarquia_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :usuarios
    drop_table :rotaciones
    drop_table :clasificaciones
    drop_table :puestos
    drop_table :documentos
    drop_table :acciones
    drop_table :carpetas
    drop_table :tipos
    drop_table :cargos
    drop_table :copias
    drop_table :notas
    drop_table :estados
    drop_table :guias
    drop_table :jerarquias
    drop_table :buzones
  end
end
