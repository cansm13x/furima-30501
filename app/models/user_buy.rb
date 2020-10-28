class UserBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, 
                :addres, :building_name, :tell, :order_user_id,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :addres, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :tell, format: { with: /\A\d{11}\z/ } 
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order_user_id = OrderUser.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, addres: addres, building_name: building_name, tell: tell, order_user_id: order_user_id.id)
  end
end
