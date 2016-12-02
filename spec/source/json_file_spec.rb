require "spec_helper"

describe "CodeInventory::JSONFile" do
  describe ".new" do
    before do
      json_file = file_fixture("source_json_two_projects_valid.json")
      @json_source = CodeInventory::JSONFile.new(json_file)
    end

    describe "when a pathname to a JSON file is given" do
      it "loads the file" do
        @json_source.projects.first["name"].must_equal "Product One"
      end
    end
  end

  describe ".projects" do
    before do
      json_file = file_fixture("source_json_two_projects_valid.json")
      @json_source = CodeInventory::JSONFile.new(json_file)
    end

    it "provides a list of projects" do
      @json_source.projects.count.must_equal 2
      @json_source.projects.first["name"].must_equal "Product One"
    end
  end
end
