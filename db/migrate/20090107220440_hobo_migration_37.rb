class HoboMigration37 < ActiveRecord::Migration
  def self.up
    drop_table :migracion_buzones_externos
    
    add_column :guias, :puesto_id, :integer
    add_column :guias, :destinatario_id, :integer
    add_column :guias, :destinos, :string
    Guia.find(:all).each{|g| 
	#como la guia es generada por una persona, todas sus copias identifican el mismo puesto.
	g.puesto_id = g.copias.first.trazas.find(:first, :conditions => 'movimiento_id = 1').usuario.puesto.id if g.puesto_id.nil? and not g.copias.first.nil?
	#si la guia es generada completa para un mismo destinatario, lo identificamos.
	if g.copias.collect{|c| c.destinatario_id}.uniq.count == 1
		g.destinatario_id = g.copias.first.destinatario_id if g.destinatario_id.nil?
		g.destinos = g.copias.first.destinatario.sigla if g.destinos.nil?
	else
		g.destinos = g.copias.collect{|c| c.destinatario.sigla}.uniq.join(",") if g.destinos.nil?
    g.destinos = '(varios)' if g.destinos.size > 40
	end
	g.save!
     }
  end

  def self.down
    remove_column :guias, :puesto_id
    remove_column :guias, :destinatario_id
    remove_column :guias, :destinos
    
    create_table "migracion_buzones_externos", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
