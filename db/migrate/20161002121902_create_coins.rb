class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :type
      t.integer :denom
      t.integer :amount

      t.timestamps
    end
  end
end
