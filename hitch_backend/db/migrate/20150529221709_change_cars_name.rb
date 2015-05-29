class ChangeCarsName < ActiveRecord::Migration
  def change
  	rename_column :cars, :type, :type_of
  end
end
