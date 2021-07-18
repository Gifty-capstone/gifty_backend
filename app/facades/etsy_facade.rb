class EtsyFacade
  def self.product(keyword)
    results = EtsyService.get_product(keyword)[:results].first
    Product.new(results, keyword)
  end
end
