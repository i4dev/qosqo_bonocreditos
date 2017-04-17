class AddBonocreditosIssues < ActiveRecord::Migration
  def change
    add_column :issues, :tipo_bonocredito, :string, :default=>"", nil: false
  	add_column :issues, :bonocreditos, :integer, default: 0, nil: false
  end
end
