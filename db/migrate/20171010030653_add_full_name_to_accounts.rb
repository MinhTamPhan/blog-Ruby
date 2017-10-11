class AddFullNameToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :fullname, :string
  end
end
