class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :reason
      t.text :description
      t.string :service_id
      t.string :service_timestamp

      t.timestamps
    end
  end
end
