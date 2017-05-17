class AddResultBannerMobileToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.attachment :result_banner_mobile
    end
  end
end
