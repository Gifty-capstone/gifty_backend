class Product
  attr_reader :id,
              :keyword,
              :name,
              :description,
              :image_url

  def initialize(data, keyword)
    @id = nil
    @keyword = keyword
    @name = data[:title]
    @description = data[:description]
    @image_url = data[:url]
  end
end
