class CreateAsistentes < ActiveRecord::Migration
  def self.up
    create_table :asistentes do |t|
      t.column :capacitacion_id, :integer, :nil => false
      t.column :usuario_id, :integer, :nil => false
      t.column :asiste, :boolean, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :asistentes
  end
end
