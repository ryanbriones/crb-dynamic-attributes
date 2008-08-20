class Panelist < ActiveRecord::Base
  include DynamicPanelAttributes
  
  has_many :panelist_attributes
  
  PanelAttribute.all.each { |attr| panel_accessor attr.name, attr.id }
end