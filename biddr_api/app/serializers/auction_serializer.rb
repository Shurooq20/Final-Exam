class ProductSerializer < ActiveModel::Serializer
    attributes(
      :id,
      :title,
      :description,
      :created_at,
      :updated_at,
      :price,
      :date
    )
  
    belongs_to :user, key: :owner
    class UserSerializer < ActiveModel::Serializer
      attributes(
        :id,
        :first_name,
        :last_name,
        :email,
        :full_name
      )
    end
  
    has_many :bids
    class BidSerializer < ActiveModel::Serializer
      attributes(
        :id,
        :title
      )
    end
end