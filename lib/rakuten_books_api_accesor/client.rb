module RakutenBooksApiAccesor

  HOST = "app.rakuten.co.jp"
  PATH = "/services/api/BooksBook/Search/20130522"

  class Client 

    def self.create
      c = RakutenBooksApiAccesor::Config.new
      yield c
      self.new(c)
    end

    def search(args={})

      keywords = ""
      args.each do | k,v |
        keywords = "#{keywords}&#{k}=#{URI.escape(v)}"
      end

      query = "?applicationId=#{@config.application_id}#{keywords}"
      path  = "#{PATH}#{query}"
      RakutenBooksApiAccesor::HttpAccesor.get_json(HOST, path)
    end

    def application_id
      @config.application_id
    end

    private 
    def initialize(config)
      @config = config
    end
  end
end
