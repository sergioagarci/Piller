class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :categoria
      t.string :content
      t.integer :usuario_id

      t.timestamps
    end
    add_index :microposts, [:usuario_id, :created_at]
  end
end
