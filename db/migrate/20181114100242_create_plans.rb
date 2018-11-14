class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :action_id, null: false, default: 0
      t.integer :event_id,  null: false, default: 0
      t.boolean :is_done,   null: false, default: 0

      t.timestamps
    end

    add_foreign_key :plans, :actions, name: 'plans_action_id_fk'
    add_foreign_key :plans, :events,  name: 'plans_event_id_fk'
    add_index :plans, %i[action_id event_id], unique: true
  end
end
