# Write your code here
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
class GetRequester

attr_accessor :uri, :response, :url
    
def initialize(url)
        @url = "#{url}"
        @uri = URI.parse(@url)
    end 

    def get_response_body
        @response = Net::HTTP.get_response(@uri)
        @response.body
    end

    def parse_json
    parsed = JSON.parse(self.get_response_body)
    parsed.tap do |key, val|
        "#{key}"["#{val}"]
        end
    end
  
end
