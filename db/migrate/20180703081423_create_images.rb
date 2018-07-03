class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string     :content
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
