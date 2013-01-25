class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :poll_id
      t.integer :allowed_responses_id
      t.integer :user_id

      t.timestamps
    end
  end

end
