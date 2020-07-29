class CreateAddIsHiddenToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :is_hidden, :boolean, default: false
  end
end
