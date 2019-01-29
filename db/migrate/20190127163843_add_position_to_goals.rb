class AddPositionToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :position, :integer, null: false
  end
end
