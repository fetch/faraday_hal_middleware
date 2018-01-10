require 'faraday_hal_middleware/version'
require 'faraday'
require 'faraday_middleware'

module FaradayHalMiddleware
end

module FaradayMiddleware
  autoload :EncodeHalJson,     'faraday_middleware/request/encode_hal_json'
  autoload :ParseHalJson,      'faraday_middleware/response/parse_hal_json'

  if Faraday::Middleware.respond_to? :register_middleware
    Faraday::Request.register_middleware \
      hal_json: -> { EncodeHalJson }

    Faraday::Response.register_middleware \
      hal_json: -> { ParseHalJson }
  end
end
