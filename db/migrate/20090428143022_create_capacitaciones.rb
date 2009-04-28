class CreateCapacitaciones < ActiveRecord::Migration
  def self.up
    create_table :capacitaciones do |t|
      t.column :tema,  :text, :nil => false
      t.column :fecha, :datetime
      t.column :lugar, :string
      t.column :duracion, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :capacitaciones
  end
end
