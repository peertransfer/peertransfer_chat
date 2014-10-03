# PeertransferChat

A wrapper to our chat system

## Installation

Add this line to your application's Gemfile:

    gem 'peertransfer_chat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peertransfer_chat

## Usage

First configure the chat client:

```ruby
PeertransferChat.configure do |config|
  config.team = team_name
  config.token = team_token
  config.channel = team_channel
  config.username = team_username
end
```

And then use `say` or `upload` class methods.
