class AddTypeToOrderRequests < ActiveRecord::Migration
  def change
    add_column :order_requests, :type, :string
  end
end
