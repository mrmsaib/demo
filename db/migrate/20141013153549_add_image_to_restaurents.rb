class AddImageToRestaurents < ActiveRecord::Migration
  def change
    add_column :restaurents, :image, :string
  end
end
