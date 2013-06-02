require 'rakuten_books_api_accesor'
require 'webmock'
require 'spec_helper'

describe RakutenBooksApiAccesor, "" do

  it "initialize" do
    client = RakutenBooksApiAccesor::Client.create do | c |
      c.application_id = "test-id"
    end
    client.application_id.should == "test-id"
  end

  it "get books" do

    json_data = <<-END_JSON
        { "Items" : [ {"Item" : {"title" : "no title"}} ] }
    END_JSON
    WebMock.stub_request(
      :get, 
      'https://app.rakuten.co.jp:443/services/api/BooksBook/Search/20130522?applicationId=123&title=dog'
    ).to_return(:body => json_data)

    client = RakutenBooksApiAccesor::Client.create do | c |
      c.application_id = "123"
    end

    response = client.search(:title => "dog").json_data
    items   = response["Items"]
    items.each do | book |
      book["Item"]["title"].should == "no title"
    end

  end

end
