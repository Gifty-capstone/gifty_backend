class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :keyword, :name, :description, :cost, :product_url
end
