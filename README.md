# Ndlib::On::Rspec

Some Rspec matchers to share across projects.

## Installation

Add this line to your application's Gemfile:

    gem 'ndlib-on-rspec'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ndlib-on-rspec

## Usage

Take a look at the /spec directory for greater clarity

### :alias_from

    object.should alias_from(:one_method).to(:another)

### :delegate

    object.should delegate(:blog_name).to(:blog).via(:name)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
