require "rakuten_books_api_accesor"

describe RakutenBooksApiAccesor, "" do
  it "initialize" do
    api = RakutenBooksApiAccesor::Api.create_accesor do | c |
      c.application_id = "test-id"
    end
    api.config.application_id.should == "test-id"
  end

end
