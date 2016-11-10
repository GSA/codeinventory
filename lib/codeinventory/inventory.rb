module CodeInventory
  class Inventory
    attr_accessor :sources

    def initialize(*sources)
      @sources = [sources].flatten
    end

    def projects
      @sources.collect { |source| source.projects }.flatten
    end
  end
end
