class AddTopicToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :topic_id, :integer #create a migration that adds a topic_id column to the posts table.
    add_index :posts, :topic_id #create an index on topic_id with the generator. Always index foreign key columns 
  end
end
