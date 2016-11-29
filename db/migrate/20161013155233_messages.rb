class Messages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.text :body
        t.boolean :destroy_immediately
        t.boolean :destroy_after
        t.string :uid
    end
  end
end
