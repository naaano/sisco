class HoboMigration39 < ActiveRecord::Migration
  def self.up
    add_column :buzones, :recibe_de_todos, :boolean, :default => true
    add_column :buzones, :envia_a_todos, :boolean, :default => true
    execute "update buzones set recibe_de_todos = true, envia_a_todos = true"
  end

  def self.down
    remove_column :buzones, :recibe_de_todos
    remove_column :buzones, :envia_a_todos
  end
end
