class ChangeAllowedResponsesCol < ActiveRecord::Migration
  def change
    rename_column :responses, :allowed_responses_id, :allowed_response_id
  end
end
