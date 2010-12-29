require 'test_helper'

class PsaTest < ActiveSupport::TestCase
  test "can create a new psa with minimal properties" do
    Factory(:psa)
    assert_equal(1, Psa.active.count)
  end
  
  test "should expire after end date" do
    Factory(:psa)
    Factory(:lapsed_psa)
    assert_equal(1, Psa.active.count)
    assert_equal(1, Psa.lapsed.count)
  end
  
  test "route should be assumed to be absolute" do
    psa = Factory(:psa_with_route, :route => '/test')    
    assert_equal('^/test$', psa.route)
  end
end