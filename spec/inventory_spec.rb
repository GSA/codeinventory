require "spec_helper"

describe "CodeInventory::Inventory" do
  before do
    json_file_two_projects = file_fixture("source_json_two_projects_valid.json")
    json_file_one_project = file_fixture("source_json_one_project_valid.json")
    @json_source_two_projects = CodeInventory::JSONFile.new(json_file_two_projects)
    @json_source_one_project = CodeInventory::JSONFile.new(json_file_one_project)
  end

  describe ".new" do
    describe "when a source is given" do
      it "adds the source to the sources list" do
        inventory = CodeInventory::Inventory.new(@json_source_two_projects)
        inventory.sources.must_include @json_source_two_projects
      end
    end

    describe "when sources are given as multiple args" do
      it "adds all the sources to the sources list" do
        inventory = CodeInventory::Inventory.new(@json_source_two_projects, @json_source_one_project)
        inventory.sources.must_include @json_source_two_projects
        inventory.sources.must_include @json_source_one_project
      end
    end

    describe "when sources are given as an array" do
      it "adds all the sources to the sources list" do
        inventory = CodeInventory::Inventory.new([@json_source_two_projects, @json_source_one_project])
        inventory.sources.must_include @json_source_two_projects
        inventory.sources.must_include @json_source_one_project
      end
    end
  end

  describe ".projects" do
    it "returns a list of projects from a single source" do
      inventory = CodeInventory::Inventory.new(@json_source_two_projects)
      inventory.projects.count.must_equal 2
    end

    it "returns a list of projects from multiple sources" do
      inventory = CodeInventory::Inventory.new(@json_source_two_projects, @json_source_one_project)
      inventory.projects.count.must_equal 3
    end
  end
end
