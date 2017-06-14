class AddDataWatermarkPositionToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :data_watermark_position, :string
  end
end
