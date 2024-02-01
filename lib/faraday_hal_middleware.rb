# frozen_string_literal: true

require 'faraday_hal_middleware/version'
require 'faraday'

module FaradayHalMiddleware
  autoload :EncodeHalJson,     'faraday_hal_middleware/request/hal_json'
  autoload :ParseHalJson,      'faraday_hal_middleware/response/hal_json'

  if Faraday::Middleware.respond_to? :register_middleware
    Faraday::Request.register_middleware(hal_json: FaradayHalMiddleware::Request::HalJson)
    Faraday::Response.register_middleware(hal_json: FaradayHalMiddleware::Response::HalJson)
  end
end
