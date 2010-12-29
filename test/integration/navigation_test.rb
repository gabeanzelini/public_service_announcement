require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "should be able to see list of psas" do
    psa = Factory(:psa)
    visit psas_path
    assert_match(/#{psa.message}/, page.body)
  end
  
  test "should be able to create a new psa from form" do
    visit psas_path
    click_link "New"
    fill_in "Message", :with => "This is a test."
    click_button "Save"
    assert_equal(psas_path, current_path)
  end
end