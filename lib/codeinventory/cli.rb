require "codeinventory"
require "thor"
require "codeinventory/cli/csv"
require "codeinventory/cli/json"

module CodeInventory
  module CLI
    class App < Thor
    end

    def self.start
      plugin_files = Gem.find_latest_files('codeinventory_plugin.rb')
      plugin_files.each do |plugin_file|
        load plugin_file
      end
      App.start
    end
  end
end
