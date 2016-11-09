$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "codeinventory"
require "minitest/spec"
require "minitest/autorun"
require "pathname"

def file_fixture(fixture_name)
  file = Pathname.new(File.dirname(__FILE__)) + "fixtures" + fixture_name
  if File.exists? file
    file
  else
    raise ArgumentError, "the fixtures directory does not contain a file named '#{fixture_name}'"
  end
end
