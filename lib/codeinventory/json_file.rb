require "json"

module CodeInventory
  class JSONFile
    def initialize(json_file)
      @projects = JSON.load(json_file)
    end

    def projects
      if block_given?
        @projects.each { |p| yield p }
      end
      @projects
    end
  end
end
