class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :text

      t.timestamps
    end
  end

end
