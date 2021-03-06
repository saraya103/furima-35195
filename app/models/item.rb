class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :day
  belongs_to :user
  has_one :order_log
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :content
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :day_id
    end
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
  end
end
