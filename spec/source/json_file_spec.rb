require "spec_helper"

describe "CodeInventory::Source::JSONFile" do
  describe ".new" do
    before do
      json_file = file_fixture("source_json_two_projects_valid.json")
      @json_source = CodeInventory::Source::JSONFile.new(json_file)
    end

    describe "when a pathname to a JSON file is given" do
      it "loads the file" do
        @json_source.projects.first["name"].must_equal "Product One"
      end
    end
  end
end
