require "json"

module CodeInventory
  module Source
    class JSONFile
      attr_accessor :projects

      def initialize(json_file)
        @projects = JSON.load(json_file)
      end
    end
  end
end
