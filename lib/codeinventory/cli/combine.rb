require "thor"
require "json"

module CodeInventory
  module CLI
    class App < Thor
      desc "combine AGENCY FILENAMES ...", "Combine multiple code.json files"
      option :replace, aliases: "-r", type: :boolean, desc: "Replace all projects' organization field values with the agency name from each existing code.json"
      option :pretty, aliases: "-p", type: :boolean, desc: "Format JSON output with linebreaks and indentation"
      def combine(agency, *filenames)
        if filenames.count == 0
          puts "You must provide at least one code.json file"
          exit 1
        end
        combined = {
          "version" => "2.0.0",
          "agency" => agency,
          "measurementType" => {
            "method" => "modules"
          },
          "releases" => []
        }
        filenames.each do |filename|
          if !File.exist? filename
            puts "File not found: #{filename}"
            exit 1
          end
          inventory = JSON.load(File.new(filename))
          projects = inventory["releases"]
          if options[:replace]
            projects.each do |project|
              project["organization"] = inventory["agency"] if !inventory["agency"].nil?
            end
          end
          combined["releases"].concat(projects)
        end
        if options["pretty"]
          puts JSON.pretty_generate(combined)
        else
          puts combined.to_json
        end
      end
    end
  end
end
