class AddColumnSalesPrice < ActiveRecord::Migration[5.0]
  def change
    # add_column :events, :category_id, :integer
    add_column :products,:sales_price,:integer
  end
end
