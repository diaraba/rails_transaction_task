class RenameOrderingTotalsColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ordering_totals, :total_quantity
  end
end
