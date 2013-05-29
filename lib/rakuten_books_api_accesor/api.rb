module RakutenBooksApiAccesor
  class Api
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def self.create_accesor
      c = RakutenBooksApiAccesor::Config.new
      yield c
      self.new(c)
    end

    def search(args={})

    end
  end
end
