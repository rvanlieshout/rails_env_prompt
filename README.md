# RailsEnvPrompt

Adds current Rails application nane, env (with color) and Apartment tenant to prompt.

Before:

```
2.5.1 :001 >
```

After:

```
MyApp/development/tenant-123 001:0>
```

The current tenant is only included if Apartment is available

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_env_prompt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_env_prompt

## Usage

None. Just include and go.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rvanlieshout/rails_env_prompt.
