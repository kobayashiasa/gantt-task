class Column < ApplicationRecord
  belongs_to :user
  validates :column_title, length: { in: 1..100 }
end
