class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user, index: true
      t.string :comment
      t.references :idea, index: true

      t.timestamps
    end
  end
end
