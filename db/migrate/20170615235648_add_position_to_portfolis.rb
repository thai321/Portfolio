class AddPositionToPortfolis < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolis, :position, :integer
  end
end
