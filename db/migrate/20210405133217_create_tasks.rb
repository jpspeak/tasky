class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :category
      t.string :name
      t.date :schedule_date
      t.time :schedule_time
      t.timestamps
    end
  end
end
