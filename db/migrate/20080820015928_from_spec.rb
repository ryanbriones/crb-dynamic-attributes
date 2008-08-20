class FromSpec < ActiveRecord::Migration
  def self.up
    create_table :panelists, :force => true do |t|
      t.string :name, :null => false
    end
    
    create_table :panel_attributes, :force => true do |t|
      t.string :name, :null => false
    end
    
    create_table :panelist_attributes, :force => true do |t|
      t.integer :panelist_id, :null => false
      t.integer :panel_attribute_id, :null => false
      t.string :value
    end
  end

  def self.down
    drop_table :panelist_attributes
    drop_table :panel_attributes
    drop_table :panelists
  end
end
