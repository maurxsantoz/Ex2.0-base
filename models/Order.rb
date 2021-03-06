class Order < ActiveRecord::Base
  belongs_to :client
  has_many :order_items
  has_many :products, through: :order_items

  validates :order_items, :client, presence: true
  validates_associated :order_items

  def price
    ##order_items,sum{|order_item| order_item.price}
    order_items.sum(&:price)
  end
  def self.order_by_price
    Order.all.order_by(&:price)
  end
  def self.most_expensive
    order_by_price.last
  end
end