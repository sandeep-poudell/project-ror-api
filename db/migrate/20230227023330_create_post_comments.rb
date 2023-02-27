class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.references :post, foreign_key: true, null: false
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
