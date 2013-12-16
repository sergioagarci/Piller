class AddCategoriaToMicrovideos < ActiveRecord::Migration
  def change
    add_column :microvideos, :categoria, :string
  end
end
