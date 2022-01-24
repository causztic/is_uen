# IsUen

Simple gem to check whether an UEN has a valid format.

Format is obtained from [https://www.uen.gov.sg/ueninternet/faces/pages/admin/aboutUEN.jspx](https://www.uen.gov.sg/ueninternet/faces/pages/admin/aboutUEN.jspx), last updated/reviewed on 08 Jan 2018.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'is_uen'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install is_uen

## Usage

```ruby
IsUen.uen?('12345678A') # business? || company?
IsUen.business?('12345678A')
IsUen.company?('123456789A')
IsUen.new_uen?('T12AB1234X')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Caveats

This gem does not verify the existence of UENs.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/causztic/is_uen.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
