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
    assert_equal(psas_path, current_path, "new should redirect to index")
    visit root_path
    assert_match(/This is a test/, page.body, "new message should show up")
  end
  
  test "should be able to edit a psa" do
    Factory(:psa, :message => 'was')
    visit psas_path
    click_link "Edit"
    fill_in "Message", :with => "is"
    click_button "Save"
    assert_equal("is", Psa.first.message)
  end
  
  test "should redirect to psas index on update" do
    Factory(:psa, :message => 'was')
    visit psas_path
    click_link "Edit"
    fill_in "Message", :with => "is"
    click_button "Save"
    assert_equal(psas_path, current_path)
  end
  
  test "should be able to delete psas" do
    Factory(:psa)
    visit psas_path
    click_link "Delete"
    assert_equal(0, Psa.count)
  end
  
  test "should only show active psas" do
    active = Factory(:psa)
    lapsed = Factory(:lapsed_psa, :message => 'lapsed message')
    
    visit psas_path
    
    assert_match(%r(<p>Showing <strong>active</strong> announcements. Show <a href="#{lapsed_psas_path}">lapsed</a> announcements.</p>), page.body)
    assert_match(/#{active.message}/, page.body)
    assert_no_match(/#{lapsed.message}/, page.body)
  end
  
  test "should only show lapsed psas" do
    active = Factory(:psa)
    lapsed = Factory(:lapsed_psa, :message => 'lapsed')
    
    visit lapsed_psas_path
  
    assert_match(%r(<p>Showing <strong>lapsed</strong> announcements. Show <a href="#{psas_path}">active</a> announcements.</p>), page.body)
    assert_match(/#{lapsed.message}/, page.body)
    assert_no_match(/#{active.message}/, page.body)
  end
  
  test "should get error if not authorized" do
    PsasController.class_eval do
      def can_manage_psas?
        return false
      end
    end
    assert_raise(ArgumentError, PublicSeriviceAnnouncement::AccessDenied) { visit psas_path }
    PsasController.class_eval do
      undef can_manage_psas?
    end
  end
  
  test "should not throw error when authorized" do
    PsasController.class_eval do
      def can_manage_psas?
        return true
      end
    end
    assert_nothing_raised(ArgumentError, PublicSeriviceAnnouncement::AccessDenied) { visit psas_path }
    PsasController.class_eval do
      undef can_manage_psas?
    end
  end
end