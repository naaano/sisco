class Jerarquia < ActiveRecord::Base
  acts_as_ordered_tree :foreign_key => :parent_id,
                         :order       => :posicion
  fields do
    parent_id :integer
    posicion :integer
    nombre :string, :name => true
  end
end
