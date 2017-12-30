class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :reporter
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
