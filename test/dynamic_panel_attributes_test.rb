require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class DynamicPanelAttributesTest < Test::Unit::TestCase
  fixtures :panelists, :panel_attributes, :panelist_attributes
  
  def test_panelist_should_respond_to_reader_gender
    assert panelists(:user1).respond_to?(:gender)
  end
  
  def test_panelist_should_respond_to_writer_gender
    assert panelists(:user1).respond_to?(:gender=)
  end
  
  def test_panelist_should_respond_to_reader_age
    assert panelists(:user1).respond_to?(:age)
  end
  
  def test_panelist_should_respond_to_writer_age
    assert panelists(:user1).respond_to?(:age=)
  end
  
  def test_gender_should_return_value_of_panelist_attribute
    assert_equal "M", panelists(:user1).gender
  end
  
  def test_age_should_return_value_of_panelist_attribute
    assert_equal "30", panelists(:user1).age
  end
  
  def test_gender_writer_should_set_value_of_panelist_attribute
    panelists(:user1).gender = "F"
    assert_equal "F", panelist_attributes(:user1_gender).value
  end
  
  def test_age_writer_should_set_value_of_panelist_attribute
    panelists(:user1).age = 40
    assert_equal "40", panelist_attributes(:user1_age).value
  end
end