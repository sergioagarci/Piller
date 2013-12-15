class CreateMicrovideos < ActiveRecord::Migration
  def change
    create_table :microvideos do |t|
      t.string :content
      t.integer :usuario_id

      t.timestamps
    end
    add_index :microvideos, [:usuario_id, :created_at]
  end
end