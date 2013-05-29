require 'net/https'
require 'json'
require 'open-uri'

module RakutenBooksApiAccesor
  HOST = "app.rakuten.co.jp"
  PATH = "/services/api/BooksBook/Search/20130522"


  class HttpResponse
    attr_reader :code, :json_data

    def initialize(args = {})
      @code      = 200
      @code      = args[:code]      if args.has_key? :code
      @json_data = args[:json_data] if args.has_key? :json_data
    end
  end

  class HttpAccesor
    def self.get_books(config, args = {}) 

      keyword = ""
      args.each do | k,v |
        keyword = "#{keyword}&#{k}=#{URI.escape(v)}"
      end

      query         = "?applicationId=#{config.application_id}#{keyword}"
      https         = Net::HTTP.new "#{HOST}", 443
      https.use_ssl = true
      result        = https.start { https.get "#{PATH}#{query}" }

      if result.code.to_i < 400 
        HttpResponse.new :code => result.code, :json_data => JSON.parse(result.body)
      else
        HttpResponse.new :code => result.code
      end
    end
  end
end
