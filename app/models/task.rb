class Task < ApplicationRecord
  belongs_to :column
  validates :task_title, length: {in: 1..100}
  validates :task_info, length: {maximum: 500}
end
