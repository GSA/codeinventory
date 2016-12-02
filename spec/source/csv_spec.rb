require "spec_helper"

describe "CodeInventory::CSVFile" do
  before do
    csv_file = file_fixture("two_projects.csv")
    @csv_source = CodeInventory::CSVFile.new(csv_file)
  end

  describe ".new" do
    it "loads the file" do
      @csv_source.csv.must_be_instance_of CSV::Table
    end

    it "detects invalid headers" do
      csv_file1 = file_fixture("two_projects_noheader.csv")
      csv_file2 = file_fixture("two_projects_invalidheader.csv")
      proc { CodeInventory::CSVFile.new(csv_file1) }.must_raise CodeInventory::FileFormatError
      proc { CodeInventory::CSVFile.new(csv_file2) }.must_raise CodeInventory::FileFormatError
    end
  end

  describe ".projects" do
    it "provides a list of projects" do
      @csv_source.projects.count.must_equal 2
      @csv_source.projects.first["name"].must_equal "Product One"
    end
  end
end
