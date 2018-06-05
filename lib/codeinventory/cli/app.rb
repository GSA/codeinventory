require "thor"

module CodeInventory
  module CLI
    class App < Thor
      desc "version", "Version information"
      def version
        puts CodeInventory::VERSION
      end
    end
  end
end
