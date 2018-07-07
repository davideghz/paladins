# Paladins

This gem wraps Hi-Rez Studios' Paladins API.

See [Paladins API DOCS](https://docs.google.com/document/d/1OFS-3ocSx-1Rvg4afAnEHlT3917MAK_6eJTR6rzr-BM) for more information.

## Status

Alpha (see [CHANGELOG.md](https://github.com/davideghz/paladins/blob/master/CHANGELOG.md))

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paladins'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paladins

## Usage

Before everything, make sure you get valid `dev_id` and `auth_key` by submitting a request [here](https://fs12.formsite.com/HiRez/form48/secure_index.html). You will get an email with keys and API instruction.

Create an initializer in `config/initializers` to set your `dev_id` and `auth_key` in a block:

```ruby
Paladins.configure do |config|
  config.dev_id = ''
  config.auth_key = ''
end

Paladins.getfoobar
```

This wrapper use the same methods' name listed in the official Hi-Rez Studios' Paladins API see [CHANGELOG.md](https://github.com/davideghz/paladins/blob/master/CHANGELOG.md) to see which methods are supported;

e.g, to get Player's info you can call `Paladins.getplayer('player_name')` from anywhere in your app.

For an exhaustive list of methods' name, check the official [Paladins API DOCS](https://docs.google.com/document/d/1OFS-3ocSx-1Rvg4afAnEHlT3917MAK_6eJTR6rzr-BM).

## Development

You are welcome to contribute to this gem!

Make sure to export your keys as `ENV` variables (note that var names must be exactly `PALADINS_DEV_ID` and `PALADINS_AUTH_KEY`)

```bash
export PALADINS_DEV_ID=xxxx
export PALADINS_AUTH_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests (currently failing). You can also run `bin/console` for an interactive prompt that will allow you to experiment. To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davideghz/paladins.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
