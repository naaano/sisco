class HoboMigration7 < ActiveRecord::Migration
  def self.up
    rename_column :usuarios, :email, :dominio
  end

  def self.down
    rename_column :usuarios, :dominio, :email
  end
end
