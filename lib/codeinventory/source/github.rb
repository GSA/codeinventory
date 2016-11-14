require "octokit"
require "yaml"

module CodeInventory
  module Source
    class GitHub
      attr_accessor :org

      def initialize(access_token:, org:)
        @access_token = access_token
        @org = org
      end

      def projects
        repos = client.organization_repositories(@org)
        projects = []
        repos.each do |repo|
          begin
            project_data = client.contents(repo[:full_name], path: ".codeinventory.yml")
            project = JSON.parse(JSON.dump(YAML.load(project_data)), symbolize_names: true)
          rescue Octokit::NotFound
            begin
              project_data = client.contents(repo[:full_name], path: ".codeinventory.json")
              project = project_data.to_hash
            rescue Octokit::NotFound
              # Ignore repositories that don't have a CodeInventory metadata file
            end
          end
          projects << project unless project.nil?
        end
        projects
      end

      def client
        @client ||= Octokit::Client.new(access_token: @access_token)
      end
    end
  end
end
