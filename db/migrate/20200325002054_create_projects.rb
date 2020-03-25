class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description
      t.string :currentStatus, null: false
      t.date :finishDate, null: false
      t.boolean :active
      t.references :category, null: false
      add_foreign_key :projects, :categories
    end
  end
end
