class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title,  null: false, default: ''
      t.text   :detail, null: false, default: ''
      t.date :limit_date

      t.timestamps
    end
  end
end
