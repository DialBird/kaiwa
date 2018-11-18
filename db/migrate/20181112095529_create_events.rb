class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :goal_id, null: false, default: 0
      t.string  :title,   null: false, default: ''
      t.text    :memo,    null: false, default: ''
      t.integer :star,    null: false, default: 0
      t.text    :review,  null: false, default: ''
      t.string  :url,     null: false, default: ''
      t.datetime :date

      t.timestamps
    end

    add_foreign_key :events, :goals, name: 'events_goal_id_fk'
  end
end
