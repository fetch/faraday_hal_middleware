# frozen_string_literal: true

module Faraday
  module HalJson
    # JSON+HAL is just JSON
    class Response < ::Faraday::Response::Json; end
  end
end
