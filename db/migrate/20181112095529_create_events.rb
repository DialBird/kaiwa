class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer  :user_id, null: false, default: 0
      t.string   :title,   null: false, default: ''
      t.text     :memo,    null: false, default: ''
      t.integer  :star,    null: false, default: 0
      t.text     :review,  null: false, default: ''
      t.datetime :date

      t.timestamps
    end

    add_foreign_key :events, :users, name: 'events_user_id_fk'
  end
end
