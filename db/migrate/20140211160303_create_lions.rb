class CreateLions < ActiveRecord::Migration
  def change
    create_table :lions do |t|
      t.string	:name
      t.integer :weight
      t.string	:status
      t.timestamps
    end
  end
end
