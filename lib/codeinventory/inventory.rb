module CodeInventory
  class Inventory
    attr_accessor :sources

    def initialize(*sources)
      @sources = [sources].flatten
    end

    def projects
      @sources.collect { |src|
        src.projects do |project|
          yield project, src if block_given?
          project
        end
      }.flatten
    end
  end
end
