require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  # Public: Parse response bodies as JSON.
  class ParseHalJson < ResponseMiddleware
    dependency do
      require 'json' unless defined?(::JSON)
    end

    define_parser do |body|
      ::JSON.parse body unless body.strip.empty?
    end
  end
end
