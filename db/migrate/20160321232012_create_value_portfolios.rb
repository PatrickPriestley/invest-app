class CreateValuePortfolios < ActiveRecord::Migration
  def change
    create_table :value_portfolios do |t|
      t.string :portfolio_name
      t.string :initial_investment
      t.string :investment_increase
      t.string :share_price
      t.string :commission_paid
      t.string :date_of_trade
      t.string :stock_symbol
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :value_portfolios, [:user_id, :created_at]
  end
end
