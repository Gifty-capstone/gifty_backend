class Product
  attr_reader :id,
              :keyword,
              :name,
              :description,
              :cost,
              :product_url

  def initialize(data, keyword)
    @id = nil
    @keyword = keyword
    @name = data[:title]
    @cost = data[:price]
    @description = data[:description]
    @product_url = data[:url]
  end
end
