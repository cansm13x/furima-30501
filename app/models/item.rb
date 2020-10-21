class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :description, :category, :status, :delivery, :area, :day, presence: true

  validates :category_id, :status_id, :delivery_id, :area_id, :day_id, numericality: { other_than: 1 }

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  def was_attached?
    image.attached?
  end
end
