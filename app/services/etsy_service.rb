class EtsyService
  class << self
    def get_product(keyword)
      response = conn.get('/v2/listings/active?') do |req|
        req.params['api_key'] = ENV['ETSY_API_KEY']
        req.params['tags'] = keyword
      end
      parse_data(response)
    end

    def conn
      Faraday.new(url: 'https://openapi.etsy.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end


