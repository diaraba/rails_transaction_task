class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :ordering_totals, default: 0

      t.timestamps
    end
  end
end
