require "thor"
require "json"
require "pathname"

module CodeInventory
  module CLI
    class App < Thor
      desc "json AGENCY FILENAME", "Build an inventory from a JSON file"
      def json(agency, filename)
        file = Pathname.new(filename)
        unless File.exist? file
          puts "No such file: #{file}"
          exit 1
        end
        source = CodeInventory::JSONFile.new(file)
        inventory = CodeInventory::Inventory.new(source)
        output = inventory.generate(agency, "1.0.1")
        puts JSON.pretty_generate(output)
      end
    end
  end
end
