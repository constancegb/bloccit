class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, index: true, foreign_key: true #index tells DB to index the post_id column, so it can be searched efficiently

      t.timestamps null: false
    end
  end
end
