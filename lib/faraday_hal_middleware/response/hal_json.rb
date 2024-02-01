# frozen_string_literal: true

module FaradayHalMiddleware
  class Response
    # JSON+HAL is just JSON
    class HalJson < ::Faraday::Response::Json; end
  end
end
