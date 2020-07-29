# PeertransferChat

A wrapper that works as a unique interface to integrate a chat system into the peerTransfer platform.

## Build Status

[![Build Status](https://secure.travis-ci.org/peertransfer/peertransfer_chat.png)](http://travis-ci.org/peertransfer/peertransfer_chat)
[![Coverage Status](https://coveralls.io/repos/peertransfer/peertransfer_chat/badge.svg?branch=master)](https://coveralls.io/r/peertransfer/peertransfer_chat)
[![Code Climate](https://codeclimate.com/github/peertransfer/peertransfer_chat.png)](https://codeclimate.com/github/peertransfer/peertransfer_chat)
[![Dependency Status](https://gemnasium.com/peertransfer/peertransfer_chat.png)](https://gemnasium.com/peertransfer/peertransfer_chat)

## Installation

Add this line to your application's Gemfile:

    gem 'peertransfer_chat', git: 'https://github.com/peertransfer/peertransfer_chat.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peertransfer_chat

## Usage

Configure the chat client:

```ruby
PeertransferChat.configure do |config|
  config.api_token = api_token
  config.channel = team_channel
  config.username = team_username
end
```

Send a message:

```ruby
PeertransferChat::Client.speak('There are issues pending review')
```

Upload a file:
```ruby
PeertransferChat::Client.upload('/path/to/a/file.txt')
```

## Slack settings description
 - `channel` Channel name
 - `api_token` This token comes from your user https://api.slack.com/web
 - `rtm_token` Real time messaging, you can find it in integration -> bot -> token
