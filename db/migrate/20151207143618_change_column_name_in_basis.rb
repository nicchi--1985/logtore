class ChangeColumnNameInBasis < ActiveRecord::Migration
  def change
    rename_column :bases, :type, :basis_type
  end
end
