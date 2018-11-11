class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.integer :user_id,  null: false, default: 0
      t.string  :title,    null: false, default: ''
      t.boolean :is_clear, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :habits, :users, name: 'habits_user_id_fk'
  end
end
