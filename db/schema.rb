# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081125192720) do

  create_table "acciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buzones", :force => true do |t|
    t.string   "nombre"
    t.string   "sigla"
    t.string   "descripcion"
    t.integer  "folio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "externo"
    t.string   "type"
  end

  create_table "cargos", :force => true do |t|
    t.string "nombre"
  end

  create_table "carpetas", :force => true do |t|
    t.string  "nombre"
    t.integer "buzon_id"
  end

  add_index "carpetas", ["buzon_id"], :name => "fki_carpetas_buzones"

  create_table "clasificaciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo"
  end

  create_table "comentarios", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "correccion_id"
    t.string   "texto"
    t.datetime "created_at"
  end

  create_table "copias", :force => true do |t|
    t.integer  "documento_id"
    t.integer  "carpeta_id"
    t.integer  "estado_id"
    t.integer  "buzon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "puesto_id"
    t.integer  "origen_id"
    t.integer  "destinatario_id"
    t.datetime "recepcion"
    t.integer  "accion_id"
  end

  add_index "copias", ["buzon_id"], :name => "fki_copias_buzones"
  add_index "copias", ["carpeta_id"], :name => "fki_copias_carpetas"
  add_index "copias", ["documento_id"], :name => "fki_copias_documentos"
  add_index "copias", ["estado_id"], :name => "fki_copias_estados"

  create_table "copias_guias", :force => true do |t|
    t.integer "copia_id"
    t.integer "guia_id"
  end

  add_index "copias_guias", ["copia_id"], :name => "fki_copias_guias_copias"
  add_index "copias_guias", ["guia_id"], :name => "fki_copias_guias_guias"

  create_table "correcciones", :force => true do |t|
    t.string   "descripcion"
    t.string   "mensajes"
    t.boolean  "corregido",   :default => false
    t.boolean  "critico",     :default => false
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "correccions", :force => true do |t|
    t.string   "descripcion"
    t.string   "mensajes"
    t.boolean  "corregido",   :default => false
    t.boolean  "critico",     :default => false
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentos", :force => true do |t|
    t.integer  "origen_id"
    t.string   "detalle_origen"
    t.string   "materia"
    t.integer  "tipo_id"
    t.integer  "clasificacion_id"
    t.integer  "accion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "externo"
    t.integer  "folio"
    t.integer  "usuario_id"
    t.integer  "parent_id"
    t.integer  "pfe"
    t.boolean  "pfe_ok",                     :default => false
    t.text     "cuerpo"
    t.text     "xml"
    t.integer  "origen_puesto_id"
    t.string   "origen_texto"
    t.string   "origen_puesto_texto"
    t.string   "origen_persona_texto"
    t.integer  "destinatario_id"
    t.integer  "destinatario_puesto_id"
    t.string   "destinatario_texto"
    t.string   "destinatario_puesto_texto"
    t.string   "destinatario_persona_texto"
    t.string   "folio_texto"
    t.boolean  "lock",                       :default => false
    t.boolean  "firma",                      :default => false
    t.string   "referencia"
    t.boolean  "digital",                    :default => false
    t.string   "origen_sigla"
    t.string   "destinatario_sigla"
    t.integer  "buzon_id"
  end

  add_index "documentos", ["accion_id"], :name => "fki_documentos_acciones"
  add_index "documentos", ["origen_id"], :name => "fki_documentos_buzones"
  add_index "documentos", ["clasificacion_id"], :name => "fki_documentos_clasificaciones"
  add_index "documentos", ["tipo_id"], :name => "fki_documentos_tipos"

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guias", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buzon_id"
  end

  add_index "guias", ["buzon_id"], :name => "fki_guias_buzones"

  create_table "jerarquias", :force => true do |t|
    t.integer "parent_id"
    t.integer "posicion"
    t.string  "nombre"
  end

  add_index "jerarquias", ["parent_id"], :name => "fki_jerarquias_jerarquias"

  create_table "movimientos", :force => true do |t|
    t.string "nombre"
  end

  create_table "notas", :force => true do |t|
    t.text     "texto"
    t.integer  "copia_id"
    t.integer  "puesto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notas", ["copia_id"], :name => "fki_notas_copias"
  add_index "notas", ["puesto_id"], :name => "fki_notas_puestos"

  create_table "puestos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buzon_id"
    t.integer  "usuario_id"
    t.integer  "cargo_id"
    t.boolean  "opartes",    :default => false
    t.boolean  "firmante",   :default => false
    t.boolean  "editor",     :default => false
  end

  add_index "puestos", ["cargo_id"], :name => "fki_buzones_cargos"
  add_index "puestos", ["buzon_id"], :name => "fki_puestos_buzones"
  add_index "puestos", ["usuario_id"], :name => "fki_puestos_usuarios"

  create_table "rotaciones", :force => true do |t|
    t.integer  "puesto_id"
    t.integer  "usuario_id"
    t.boolean  "asigna",     :default => true
    t.datetime "created_at"
  end

  add_index "rotaciones", ["puesto_id"], :name => "fki_rotaciones_puestos"
  add_index "rotaciones", ["usuario_id"], :name => "fki_rotaciones_usuarios"

  create_table "tipos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trazas", :force => true do |t|
    t.integer  "copia_id"
    t.integer  "movimiento_id"
    t.datetime "created_at"
    t.integer  "usuario_id"
    t.integer  "buzon_id"
  end

  add_index "trazas", ["copia_id"], :name => "fki_trazas_copias"
  add_index "trazas", ["movimiento_id"], :name => "fki_trazas_movimientos"

  create_table "usuarios", :force => true do |t|
    t.string  "login"
    t.string  "nombre"
    t.string  "apellido"
    t.string  "dominio"
    t.boolean "admin"
    t.string  "password"
    t.string  "password_confirmation"
  end

end
