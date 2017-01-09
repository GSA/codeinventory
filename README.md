# CodeInventory: The People's Code

*_This is an experimental gem that is currently in an alpha stage. The features and interface are unstable and may change at any time._*

The `codeinventory` gem is provides a CLI tool and a programmatic interface to harvest project metadata from an agency's repositories. The harvested metadata can be used to produce a [code.json](https://code.gov/#/policy-guide/docs/compliance/inventory-code) file for [Code.gov](https://code.gov/). The gem includes the ability to pull project metadata from these sources:

* JSON files
* CSV files

More sources can be added via plugins:

* [GitHub](https://github.com/GSA/codeinventory-github)

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
  * [CLI](#cli)
  * [JSON Source](#json-source)
  * [CSV Source](#csv-source)
  * [Multiple Sources](#multiple-sources)
* [Development](#development)
* [Contributing](#contributing)

## Installation

You will need [Ruby](https://www.ruby-lang.org/en/) on your system in order to install and use this gem.

Add this line to your application's Gemfile:

```ruby
gem 'codeinventory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeinventory

## Usage

### CLI

After installing this gem, you can run `codeinv`, an extensible command-line interface (CLI).

```
$ codeinv
Commands:
  codeinv csv FILENAME    # Build an inventory from a CSV file
  codeinv help [COMMAND]  # Describe available commands or one specific command
  codeinv json FILENAME   # Build an inventory from a JSON file
```

To generate a code inventory from an existing CSV file, for instance:

```
codeinv csv my_csv_file.csv
```

For information on the required format of JSON and CSV input files, see [JSON Source](#json-source) and [CSV Source](#csv-source).

The CLI can be extended to support other sources just by installing a gem. For instance, if you install the [codeinventory-github](https://github.com/GSA/codeinventory-github) gem, you'll automatically get the `github` subcommand:

```
$ codeinv
Commands:
  codeinv csv FILENAME                                     # Build an inventory from a CSV file
  codeinv github GITHUB_ACCESS_TOKEN GITHUB_ORG [OPTIONS]  # Build an inventory from GitHub
  codeinv help [COMMAND]                                   # Describe available commands or one s...
  codeinv json FILENAME                                    # Build an inventory from a JSON file
```


### JSON Source

```ruby
json_source = CodeInventory::JSONFile.new(File.new("some_projects.json"))

inventory = CodeInventory::Inventory.new(json_source)
inventory.projects # Returns an array of all projects in the JSON file
```

When using `CodeInventory::JSONFile`, the source file is expected to be a JSON file in the following format:

```json
[
  {
    "name": "Product One",
    "description": "An awesome product.",
    "license": "http://www.usa.gov/publicdomain/label/1.0/",
    "openSourceProject": 1,
    "governmentWideReuseProject": 1,
    "tags": [
      "usa"
    ],
    "contact": {
      "email": "example@example.com"
    }
  },
  {
    "name": "Product Two",
    "description": "Another awesome product.",
    "license": "http://www.usa.gov/publicdomain/label/1.0/",
    "openSourceProject": 0,
    "governmentWideReuseProject": 0,
    "tags": [
      "national-security",
      "top-secret"
    ],
    "contact": {
      "email": "example@example.com"
    }
  }
]

```

See the [Code.gov documentation](https://code.gov/#/policy-guide/docs/compliance/inventory-code) for specifics on required fields and value types.

### CSV Source

```ruby
csv_source = CodeInventory::CSVFile.new(File.new("more_projects.csv"))

inventory = CodeInventory::Inventory.new(csv_source)
inventory.projects # Returns an array of all projects in the CSV file
```

When using `CodeInventory::CSVFile`, the source file is expected to be a CSV file in the following format:

```csv
name,description,license,openSourceProject,governmentWideReuseProject,tags,contact.email
Product One,An awesome product.,http://www.usa.gov/publicdomain/label/1.0/,1,1,usa,example@example.com
Product Two,Another awesome product.,http://www.usa.gov/publicdomain/label/1.0/,0,0,"national-security,top-secret",example@example.com
```

See the [Code.gov documentation](https://code.gov/#/policy-guide/docs/compliance/inventory-code) for specifics on required fields and value types.

### Multiple Sources

You can combine multiple sources when building an inventory.

```ruby
json_source = CodeInventory::JSONFile.new(File.new("some_projects.json"))
csv_source = CodeInventory::CSVFile.new(File.new("more_projects.csv"))

inventory = CodeInventory::Inventory.new(json_source, csv_source)
inventory.projects # Returns an array of all projects in the JSON and CSV files
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in [`version.rb`](/lib/codeinventory/version.rb), and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GSA/codeinventory.
