class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aasm_state, :string, null: false, default: ''
    add_column :users, :uid,        :string, null: false, default: ''
    add_column :users, :provider,   :string, null: false, default: ''
    add_column :users, :last_name,  :string, null: false, default: ''
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :nick_name,  :string, null: false, default: ''

    add_index :users, %i[uid provider], name: 'by_uid', unique: true
  end
end
