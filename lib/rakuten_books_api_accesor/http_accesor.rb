require 'net/https'
require 'json'
require 'open-uri'

module RakutenBooksApiAccesor

  class HttpResponse
    attr_reader :code, :json_data

    def initialize(args = {})
      @code      = 200
      @code      = args[:code]      if args.has_key? :code
      @json_data = args[:json_data] if args.has_key? :json_data
    end
  end

  class HttpAccesor
    def self.get_json(host, path) 

      https         = Net::HTTP.new "#{host}", 443
      https.use_ssl = true
      result        = https.start { https.get "#{path}" }

      if result.code.to_i < 400 
        HttpResponse.new :code => result.code, :json_data => JSON.parse(result.body)
      else
        HttpResponse.new :code => result.code
      end
    end
  end
end
