# frozen_string_literal: true

require 'faraday_hal_middleware/version'
require_relative 'faraday_hal_middleware/request/hal_json'
require_relative 'faraday_hal_middleware/response/hal_json'

module FaradayHalMiddleware
  Faraday::Request.register_middleware(hal_json: ::FaradayHalMiddleware::Request::HalJson)
  Faraday::Response.register_middleware(hal_json: ::FaradayHalMiddleware::Response::HalJson)
end
