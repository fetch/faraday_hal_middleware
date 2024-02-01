# frozen_string_literal: true

require_relative 'hal_json/version'
require_relative 'hal_json/request'
require_relative 'hal_json/response'

module Faraday
  module HalJson
    ::Faraday::Request.register_middleware(hal_json: ::Faraday::HalJson::Request)
    ::Faraday::Response.register_middleware(hal_json: ::Faraday::HalJson::Response)
  end
end
