require 'rakuten_books_api_accesor'
require 'webmock'
require 'simplecov'

describe RakutenBooksApiAccesor::HttpAccesor, "" do
  before do
    SimpleCov.start
  end

  it "getBooks" do
    json_data = <<-END_JSON
        { "title" : "no title" }
    END_JSON
    WebMock.stub_request(
      :get, 
      'https://app.rakuten.co.jp:443/services/api/BooksBook/Search/20130522?applicationId=123&title=java'
    ).to_return(:body => json_data)

    config = RakutenBooksApiAccesor::Config.new
    config.application_id = "123"
    
    http_response = RakutenBooksApiAccesor::HttpAccesor.get_books(config, :title => "java")
    http_response.code.should               == "200"
    http_response.json_data["title"].should == "no title"
    
  end

end


