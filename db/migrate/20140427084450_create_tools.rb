class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
