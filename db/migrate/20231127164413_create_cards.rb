class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.text :additional_resources

      t.timestamps
    end
  end
end
