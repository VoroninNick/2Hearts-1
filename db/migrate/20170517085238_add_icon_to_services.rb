class AddIconToServices < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.attachment :icon
    end
  end
end
