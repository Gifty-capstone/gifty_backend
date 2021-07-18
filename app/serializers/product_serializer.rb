class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :keyword, :image_url
end
