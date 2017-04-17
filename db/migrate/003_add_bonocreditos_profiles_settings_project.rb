class AddBonocreditosProfilesSettingsProject < ActiveRecord::Migration
  def change
    add_column :projects, :bonocredito_student_role_id, :integer
  end
end
