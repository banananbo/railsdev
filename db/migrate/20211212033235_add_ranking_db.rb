class AddRankingDb < ActiveRecord::Migration[6.0]
  def change
    create_table :ranking do |t|
      t.string :name , null: false
    end
    create_table :category do |t|
      t.string :name , null: false
    end
  end
end
