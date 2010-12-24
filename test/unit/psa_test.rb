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
  end
end