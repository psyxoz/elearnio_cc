class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.references :author, foreign_key: { to_table: :talents }
      t.timestamps
    end
  end
end
