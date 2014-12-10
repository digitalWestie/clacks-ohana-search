class AddActivationFieldsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :activation, :string
    add_column :issues, :is_activated, :boolean, default: false
  end
end
