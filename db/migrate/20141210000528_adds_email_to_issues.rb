class AddsEmailToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :email, :string
  end
end
