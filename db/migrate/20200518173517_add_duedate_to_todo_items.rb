class AddDuedateToTodoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_items, :duedate, :date
  end
end
