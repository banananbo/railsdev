class FixRankingDb < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name , null: false
      t.timestamps
    end
    create_table :components do |t|
      t.string :name , null: false
      t.belongs_to :categories
      t.timestamps
    end
    create_table :scores do |t|
      t.belongs_to :components
      t.bigint :score
      t.timestamps
    end
    create_table :ranking_types do |t|
      t.string :name , null: false
      t.timestamps
    end
    create_table :rankings do |t|
      t.belongs_to :ranking_types
      t.belongs_to :components
      t.bigint :rank
      t.timestamps
    end
    
    drop_table :ranking
    drop_table :category
  end
end
