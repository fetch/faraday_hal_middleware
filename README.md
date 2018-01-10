# FaradayHalMiddleware

[Faraday](https://github.com/lostisland/faraday) Middleware for JSON HAL requests and responses with `application/hal+json` content-type.

[![Build Status](https://travis-ci.org/fetch/faraday_hal_middleware.svg?branch=master)](https://travis-ci.org/fetch/faraday_hal_middleware)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday_hal_middleware'
```

## Usage

Use `faraday_hal_middleware` in a similar way to [other Faraday middleware](https://github.com/lostisland/faraday_middleware).

```ruby
require 'faraday_hal_middleware'

connection = Faraday.new 'http://example.com/api' do |conn|
  conn.request :hal_json
  conn.response :hal_json, content_type: /\bjson$/

  conn.adapter Faraday.default_adapter
end
```

This gem is notably used in [Hyperclient](https://github.com/codegram/hyperclient), see [hyperclient#81](https://github.com/codegram/hyperclient/pull/81) for details.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright & License

Copyright (c) 2014-2018 Koen Punt <koen@fetch.nl> and contributors.

MIT License, see [LICENSE.txt](LICENSE.txt) for details.
