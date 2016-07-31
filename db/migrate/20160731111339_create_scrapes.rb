class CreateScrapes < ActiveRecord::Migration
  def change
    create_table :scrapes do |t|

      t.timestamps null: false
    end
  end
end
