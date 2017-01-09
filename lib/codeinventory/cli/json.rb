require "thor"
require "json"
require "pathname"

module CodeInventory
  module CLI
    class App < Thor
      desc "json FILENAME", "Build an inventory from a JSON file"
      def json(filename)
        file = Pathname.new(filename)
        unless File.exist? file
          puts "No such file: #{file}"
          exit 1
        end
        source = CodeInventory::JSONFile.new(file)
        inventory = CodeInventory::Inventory.new(source)
        projects = inventory.projects
        puts JSON.pretty_generate(projects)
      end
    end
  end
end
