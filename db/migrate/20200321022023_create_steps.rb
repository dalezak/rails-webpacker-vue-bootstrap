class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :type
      t.string :name
      t.text :description
      t.integer :ordinal
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
