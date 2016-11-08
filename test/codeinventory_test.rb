require 'test_helper'

class CodeInventoryTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CodeInventory::VERSION
  end
end
