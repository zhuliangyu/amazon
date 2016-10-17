class ChagePrice < ActiveRecord::Migration[5.0]

  def change

    change_table :products do |t|
      t.change :price, :float
    end

  end




end
