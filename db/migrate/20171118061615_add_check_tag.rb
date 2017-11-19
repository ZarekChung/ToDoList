class AddCheckTag < ActiveRecord::Migration[5.1]
  def change
    add_column :todolists, :check_box, :boolean
  end
end
