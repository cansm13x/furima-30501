class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :delivery, :area, :day

  validates :name, :description, :category, :status, :delivery, :area, :day, :price, presence: true

  validates :category_id, :status_id, :delivery_id, :area_id, :day_id, numericality: { other_than: 1 }
end
