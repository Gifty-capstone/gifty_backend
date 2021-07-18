class EtsyFacade
  def self.product(keyword)
    results = EtsyService.get_product(keyword)[:results]
    results.map do |product|
      Product.new(product, keyword)
    end
  end
end
