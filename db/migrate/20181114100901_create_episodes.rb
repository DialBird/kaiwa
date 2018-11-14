class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :user_id,    null: false, default: 0
      t.string  :title,      null: false, default: ''
      t.string  :content,    null: false, default: ''
      t.integer :star,       null: false, default: 0
      t.integer :logs_count, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :episodes, :users, name: 'episodes_user_id_fk'
  end
end
