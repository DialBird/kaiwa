class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :logable, polymorphic: true, index: true, comment: 'ポリモーフィックID'
      t.integer :event_id, null: false, default: 0
      t.text    :memo,     null: false, default: ''
      t.integer :star,     null: false, default: 0

      t.timestamps
    end

    add_foreign_key :logs, :events, name: 'logs_event_id_fk'
    add_index :logs, %i[logable_type logable_id event_id], unique: true
  end
end
