class AddTituloComentarioToMicrovideos < ActiveRecord::Migration
  def change
    add_column :microvideos, :titulo, :string
    add_column :microvideos, :comentario, :string
  end
end
