require 'test_helper'

class PsaHelperTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  test "should show active psa message" do
    psa = Factory(:psa)    
    visit root_path
    assert_match(psa.message, page.body)
  end
  
  test "should expire after viewing it 5 times" do
    psa = Factory(:psa_with_max_views, :max_views => 5)
    5.times do |i|
      visit root_path
      assert_match(/#{psa.message}/, page.body, "should show up on the #{(i+1).ordinalize} viewing")
    end
    visit root_path
    assert_no_match(/#{psa.message}/, page.body)
  end
  
  test "should only display psa if route matches" do
    psa = Factory(:psa_with_route, :route => '/test')
    visit root_path
    assert_no_match(/#{psa.message}/, page.body)
  end
  
  test "should only display psa if user-agent matches" do
    Capybara.current_session.driver.header("User-Agent", "Firefox")
    psa = Factory(:psa_with_user_agent, :user_agent => 'bla')
    visit root_path
    assert_no_match(/#{psa.message}/, page.body)
  end
end
