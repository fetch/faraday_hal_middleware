require 'faraday_middleware/response/parse_json'

module FaradayMiddleware
  # JSON+HAL is just JSON
  class ParseHalJson < ParseJson
  end
end
