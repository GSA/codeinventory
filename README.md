# CodeInventory: The People's Code

*_This is an experimental gem that is currently in an alpha stage. The features and interface are unstable and may change at any time._*

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

Basically:

```ruby
json_source = CodeInventory::Source::JSONFile.new(File.new("some_projects.json"))
csv_source = CodeInventory::Source::CSVFile.new(File.new("more_projects.csv"))
github_source = CodeInventory::Source::GitHub.new(access_token: "GITHUB_ACCESS_TOKEN", org: "github_org_name")

inventory = CodeInventory::Inventory.new(json_source, csv_source, github_source)
inventory.projects # Returns an array of all projects
```

### JSON Source

When using `CodeInventory::Source::JSONFile`, the source file is expected to be a JSON file in the following format:

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

When using `CodeInventory::Source::CSVFile`, the source file is expected to be a CSV file in the following format:

```csv
name,description,license,openSourceProject,governmentWideReuseProject,tags,contact.email
Product One,An awesome product.,http://www.usa.gov/publicdomain/label/1.0/,1,1,usa,example@example.com
Product Two,Another awesome product.,http://www.usa.gov/publicdomain/label/1.0/,0,0,"national-security,top-secret",example@example.com
```

See the [Code.gov documentation](https://code.gov/#/policy-guide/docs/compliance/inventory-code) for specifics on required fields and value types.

### GitHub Source

When using `CodeInventory::Source::GitHub`, provide a [GitHub access token](https://developer.github.com/v3/oauth/) and the GitHub organization name (e.g., "[GSA](https://github.com/GSA/)"). Each repository within the organization that needs to be included in the project listing should have a `.codeinventory.yml` or `.codeinventory.json` file in the repository's root directory.

#### YAML Format (.codeinventory.yml)

```yaml
name: Product One
description: An awesome product.
license: http://www.usa.gov/publicdomain/label/1.0/
openSourceProject: 1
governmentWideReuseProject: 1
tags:
  - usa
contact:
  email: example@example.com
```

#### JSON Format (.codeinventory.json)

```json
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
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in [`version.rb`](/lib/codeinventory/version.rb), and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GSA/codeinventory.
