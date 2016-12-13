class CreateVideo < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.timestamps null: false
    end
  end
end
