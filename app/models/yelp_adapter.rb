class YelpAdapter

  include HTTParty


  MAX_YELP_SCRAPE = 50

  base_uri 'api.yelp.com'

    def search(search_string, location)

      response = self.class.get("/v3/businesses/search",
        query:
          {
            categories: "alcohol",
            term: "#{search_string}",
            location: "#{location}",
            limit: "#{MAX_YELP_SCRAPE}"

          },
        headers:
          {
            Authorization: ENV['YELP_API_KEY']
          }
        )
      parsed = JSON.parse(response.body)

      parsed["businesses"].map do |business|
        if valid_business?(business)
          parse_business(business
        end
      end
    end 

    def valid_business?(business_hash)
      return true if business_hash["name"] && business_hash["image_url"] && business_hash["url"]
      false
    end 

    def parse_business(business_hash)
      parsed_business = { name: business_hash["name"],
                          image_url: business_hash["image_url"],
                          url: business_hash["url"]
      }
      return parsed_business
    end 
end 

