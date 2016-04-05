class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :company_name
      t.string :ticker

      t.timestamps null: false
    end
  end
end
