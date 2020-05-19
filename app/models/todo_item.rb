class TodoItem < ApplicationRecord
  belongs_to :todo_list








  
  enum priority: [:high, :medium, :low]
  def completed?
    !completed_at.blank?
   end
   validates :content, presence: true
end
