module RakutenBooksApiAccesor
  class Client 

    def self.create
      c = RakutenBooksApiAccesor::Config.new
      yield c
      self.new(c)
    end

    def search(args={})
      RakutenBooksApiAccesor::HttpAccesor.get_books(@config, args)
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
