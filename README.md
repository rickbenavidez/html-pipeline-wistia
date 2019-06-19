# HTML::Pipeline Wistia Gem
A html-pipeline filter that transforms wistia URLs into an iframe embed.  For more
information on iframe embed options, see [Wistia's developer documentation](https://wistia.com/support/developers/iframe-embed-options)

Inspired by other pipeline filters, including Stan Luo's work on 
[html-pipeline-youtube](https://github.com/st0012/html-pipeline-youtube).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'html-pipeline'
gem 'html-pipeline-wistia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install html-pipeline-wistia

## Usage

See [html-pipeline](https://github.com/jch/html-pipeline)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. [Fork it]( https://github.com/rickbenavidez/html-pipeline-wistia/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
