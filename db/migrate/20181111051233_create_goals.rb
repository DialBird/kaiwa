class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id,     null: false, default: 0
      t.string  :title,       null: false, default: ''
      t.text    :detail,      null: false, default: ''
      t.boolean :is_clear,    null: false, default: 0
      t.boolean :is_selected, null: false, default: 0
      t.date :limit_date

      t.timestamps
    end

    add_foreign_key :goals, :users, name: 'goals_user_id_fk'
  end
end
