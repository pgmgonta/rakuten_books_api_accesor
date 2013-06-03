require 'rakuten_books_api_accesor'
require 'webmock'
require 'spec_helper'

describe RakutenBooksApiAccesor::HttpAccesor, "" do

  it "get_json" do
    json_data = <<-END_JSON
        { "title" : "no title" }
    END_JSON
    WebMock.stub_request(
      :get, 
      'https://app.rakuten.co.jp:443/services/api/BooksBook/Search/20130522?applicationId=123&title=java'
    ).to_return(:body => json_data)

    http_response = RakutenBooksApiAccesor::HttpAccesor.get_json(
      "app.rakuten.co.jp", 
      "/services/api/BooksBook/Search/20130522?applicationId=123&title=java"
    )
    http_response.code.should               == "200"
    http_response.json_data["title"].should == "no title"
    
  end

end


