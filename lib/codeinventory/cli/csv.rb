require "thor"
require "json"
require "pathname"

module CodeInventory
  module CLI
    class App < Thor
      desc "csv AGENCY FILENAME", "Build an inventory from a CSV file"
      def csv(agency, filename)
        file = Pathname.new(filename)
        unless File.exist? file
          puts "No such file: #{file}"
          exit 1
        end
        source = CodeInventory::CSVFile.new(file)
        inventory = CodeInventory::Inventory.new(source)
        output = inventory.generate(agency, "1.0.1")
        puts JSON.pretty_generate(output)
      end
    end
  end
end
