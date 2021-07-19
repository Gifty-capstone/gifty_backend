class GiftSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :status
  attribute :products do |object|
    EtsyFacade.product(object.name)
  end
end
