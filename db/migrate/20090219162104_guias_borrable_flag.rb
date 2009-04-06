class GuiasBorrableFlag < ActiveRecord::Migration
  def self.up
    add_column :guias, :borrable, :boolean, :default => true
    execute "UPDATE guias SET borrable = false"
  end

  def self.down
    remove_column :guias, :borrable
  end
end
