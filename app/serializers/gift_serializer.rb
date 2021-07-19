class GiftSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :status
  attribute :products do |object|
    EtsyFacade.product(:name)
  end
end
