class CreateAllowedResponses < ActiveRecord::Migration
  def change
    create_table :allowed_responses do |t|
      t.text :response
      t.integer :poll_id

      t.timestamps
    end
  end

end
