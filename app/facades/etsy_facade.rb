class EtsyFacade
  def self.product(keyword)
    results = EtsyService.get_product(keyword)[:results][0..4]
    results.map do |product|
      Product.new(product, keyword)
    end
  end
end
