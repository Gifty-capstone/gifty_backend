class EtsyFacade
  def self.product(keyword)
    Rails.cache.fetch("#{keyword}-products", expires_in: 24.hours) do
      results = EtsyService.get_product(keyword)[:results].sample(3)
      results.map do |product|
        Product.new(product, keyword)
      end
    end
  end
end
