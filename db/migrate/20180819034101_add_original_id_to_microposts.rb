class AddOriginalIdToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :original_id, :integer
  end
end
