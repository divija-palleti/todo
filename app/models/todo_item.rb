class TodoItem < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :todo_list
  enum priority: [:high, :medium, :low]
  def completed?
    completed_at.present?
   end
   validates :content, presence: true
end
