class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories :primary_key => :id do |t|
      t.integer :id
      t.string  :name, null: false
      t.string  :description
    end
  end
end
