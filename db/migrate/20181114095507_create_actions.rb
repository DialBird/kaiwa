class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :goal_id,    null: false, default: 0
      t.string  :title,      null: false, default: ''
      t.text    :memo,       null: false, default: ''
      t.integer :star,       null: false, default: 0
      t.integer :logs_count, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :actions, :goals, name: 'actions_goal_id_fk'
  end
end
