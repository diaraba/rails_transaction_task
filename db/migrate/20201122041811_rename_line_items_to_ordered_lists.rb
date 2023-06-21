class RenameLineItemsToOrderedLists < ActiveRecord::Migration[6.0]
  def change
    rename_table :line_items, :ordered_lists
  end
end
