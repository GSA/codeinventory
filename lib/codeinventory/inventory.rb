module CodeInventory
  class Inventory
    attr_accessor :sources

    def initialize(*sources)
      @sources = [sources].flatten
    end

    def projects
      projects = []
      @sources.each do |source|
        projects << source.projects
      end
      projects.flatten
    end
  end
end
