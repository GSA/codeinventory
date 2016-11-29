require 'spec_helper'

describe 'CodeInventory' do
  it 'has a semantic version number' do
    CodeInventory::VERSION.must_match(/^([0-9]+)\.([0-9]+)\.([0-9]+)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+[0-9A-Za-z-]+)?$/)
  end
end
