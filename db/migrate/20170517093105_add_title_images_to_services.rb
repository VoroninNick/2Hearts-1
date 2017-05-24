class AddTitleImagesToServices < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.attachment :small_title_image
      t.attachment :large_title_image
    end
  end
end
