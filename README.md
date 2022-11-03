# Litera - Messages Dashboard

This rails engine aims to provide a simple dasboard for the messages
received in your application regardless the services you are using to
handle your messages (GooglePubSub, Amazon SQS, Apache Kafka, etc) in
order to easily track and debug the data in your received data.

## Installation

Add `Litera` to your application's Gemfile:

```ruby
gem "litera"
```

And then install litera:

```bash
rails g litera:install
```

Install litera migrations:

```bash
rails g litera:install:migrations
```

Run pending migrations:

```bash
rails db:migrate
```

Lastly, mount litera engine in your `config/routes.rb`:

```bash
Rails.application.routes.draw do
  mount Litera::Engine => "/litera"
  ...
end
```

## Configuration

Configure what is the name of the method that returns your current user
and how he will be authorized to access the messages dashboard.

```ruby
Litera.setup do |config|
  # Configure what is the name of the method that returns the current
  # logged in user in your application.
  # config.litera_user = :current_user

  # Setup the name of the main application controller in your application.
  # config.parent_controller = "ApplicationController"

  # Define how the current user will be authorized ot not to access the
  # messages dashboard.
  # config.authorization = -> (user) do
    # user.admin?
  # end
end
```

## Usage

Track your messages inmmediately after you received them using:

```ruby
Litera::Message.create!({
  service: :google_pub_sub,
  body: message.body,
  metadata: message.attributes,
  external_id: message.message_id,
  published_at: message.published_at
})
```

You can use an active job if you want to save it in background:

```ruby
Litera::MessageJob.perform_later({
  service: :google_pub_sub,
  body: message.body,
  metadata: message.attributes,
  external_id: message.message_id,
  published_at: message.published_at
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and the created tag, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amco/litera-rb.
This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the
[code of conduct](https://github.com/amco/litera-rb/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Litera project's codebases, issue trackers, chat rooms
and mailing lists is expected to follow the
[code of conduct](https://github.com/amco/litera-rb/blob/master/CODE_OF_CONDUCT.md).
