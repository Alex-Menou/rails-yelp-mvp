class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, presence: true, format: { without: /\A\s*\z/, message: "can't be blank" }
  validates :address, presence: true, format: { without: /\A\s*\z/, message: "can't be blank" }
  validates :category, presence: true, inclusion: { in: CATEGORIES }

end
