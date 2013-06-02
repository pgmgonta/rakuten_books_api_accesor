# RakutenBooksApiAccesor

RakutenBooksApiAccesor is Web-API wrapper. 
RakutenBooksApiAccesor supported Rakuten Books API Version 2.

Show detail http://webservice.rakuten.co.jp/api/booksbooksearch2/

## Installation

Add this line to your application's Gemfile:

    gem 'rakuten_books_api_accesor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rakuten_books_api_accesor

## Usage
  client = RakutenBooksApiAccesor::Client.create do | c |
  c.application_id = "1234567890123" # Set Your ApplicationID
  end

  response = client.search(:title => "dog").json_data
  items   = response["Items"]
  items.each do | book |
    # 
  end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
