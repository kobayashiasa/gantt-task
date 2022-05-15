class Column < ApplicationRecord
  include RankedModel
  ranks :row_order
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :column_title, length: { in: 1..100 }
end
