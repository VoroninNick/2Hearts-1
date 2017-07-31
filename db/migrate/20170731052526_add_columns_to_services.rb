class AddColumnsToServices < ActiveRecord::Migration
  def change
    add_column :services, :images_scheme, :string
  end
end
