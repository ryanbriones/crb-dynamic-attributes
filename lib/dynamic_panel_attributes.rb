module DynamicPanelAttributes
  def self.included(base_class)
    base_class.extend ClassMethods
    base_class.send(:include, InstanceMethods)
  end
  
  module ClassMethods
    def panel_accessor(name, id)
      define_method(name.to_sym) do
        pa = initialize_panel_attribute(name, id)
        return (pa.value rescue nil)
      end

      define_method("#{name}=".to_sym) do |new_value|
        pa = initialize_panel_attribute(name, id)

        if pa
          pa.value = new_value
        else
          pa = panelist_attributes.build(:panel_attribute_id => id, :value => new_value)
          instance_variable_set("@panel_attribute_#{name}", pa)
        end

        instance_variable_get("@panel_attribute_#{name}").save
        return pa
      end
    end
  end
  
  module InstanceMethods
    private

    def initialize_panel_attribute(name, id)
      unless instance_variable_get("@panel_attribute_#{name}")
        instance_variable_set("@panel_attribute_#{name}", panelist_attributes.find_by_id(id))
      end

      instance_variable_get("@panel_attribute_#{name}")
    end
  end
end