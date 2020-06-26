class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at, null: false
    end
  end
end
