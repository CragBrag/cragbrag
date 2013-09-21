class AddGradeTypeToProblem < ActiveRecord::Migration
  def change
  	add_column :problems, :grade_type, :string
    Problem.all.each do |prob|
      prob.update(:grade_type=>Grade.grade_types.first)
      prob.save
    end
  end
end
