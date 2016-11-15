# CodeInventory: The People's Code

The `codeinventory` gem is a tool to harvest project metadata from an agency's repositories. The harvested metadata can be used to produce a [code.json](https://code.gov/#/policy-guide/docs/compliance/inventory-code) file for [Code.gov](https://code.gov/). The gem includes the ability to pull project metadata from these sources:

* JSON files
* CSV files
* GitHub

More sources can be added.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codeinventory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeinventory

## Usage

```ruby
json_source = CodeInventory::Source::JSONFile.new(File.new("some_projects.json"))
csv_source = CodeInventory::Source::CSVFile.new(File.new("more_projects.csv"))
github_source = CodeInventory::Source::GitHub.new(access_token: "GITHUB_ACCESS_TOKEN", org: "github_org_name")

inventory = CodeInventory::Inventory.new(json_source, csv_source, github_source)
inventory.projects # Returns an array of all projects
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jfredrickson5/codeinventory.
