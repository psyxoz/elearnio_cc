class CreateCoursesTalentsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :talents do |t|
      t.index :course_id
      t.index :talent_id
    end
  end
end
