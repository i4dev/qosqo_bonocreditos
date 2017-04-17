class AddBonocreditosSettingsProject < ActiveRecord::Migration
  def change
    add_column :projects, :bonocredito_tracker_id, :integer
  end
end
