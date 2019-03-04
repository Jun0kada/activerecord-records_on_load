# Activerecord::RecordsOnLoad
[![Build Status](https://travis-ci.org/Jun0kada/activerecord-records_on_load.svg?branch=master)](https://travis-ci.org/Jun0kada/activerecord-records_on_load)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-records_on_load'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-records_on_load

## Usage

```ruby
User.all.on_load do |records|
  puts "User #{records.size} records just loaded!"
end

User.all.on_load do |records|
  ActiveRecord::Associations::Preloader.new.preload(
    records.select(&:admin?),
    :role
  )
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerecord-records_on_load. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Activerecord::RecordsOnLoad project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activerecord-records_on_load/blob/master/CODE_OF_CONDUCT.md).
