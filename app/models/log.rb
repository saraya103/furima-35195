class Log
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture, :city, :address, :building, :tel, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true, message: 'is invalid. Input only number' }
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order_log = OrderLog.create(item_id: item_id, user_id: user_id)
    Order.create(postal_number: postal_number, prefecture_id: prefecture, city: city, address: address, building: building,
                 tel: tel, order_log_id: order_log.id)
  end
end
